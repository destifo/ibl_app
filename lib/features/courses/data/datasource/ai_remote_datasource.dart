import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibl_app/core/core.dart';
import 'package:ibl_app/features/courses/data/models/ai_search_meta_data.dart';

class AIRemoteDatasource {
  final baseUrl = "https://base.manager.iblai.app";
  final http.Client client = http.Client();

  Future<List<AISearchMetaData>> getAIs() async {
    final url = "$baseUrl/ai-search";

    try {
      final response = await http.get(Uri.parse(url), headers: {
        "User-Agent": "PostmanRuntime/7.36.0",
        "Accept": "*/*",
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> dataList = data["results"];
        print("************ ${dataList.length}");
        return dataList.map((e) => AISearchMetaData.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("************ $e");
      throw ServerException();
    }
  }
}
