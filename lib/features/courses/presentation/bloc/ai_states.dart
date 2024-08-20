
import 'package:ibl_app/features/courses/data/models/ai_search_meta_data.dart';

abstract class AISearchState {}

class AiInitial extends AISearchState {}

class AiLoading extends AISearchState {}

class AiLoaded extends AISearchState {
  final List<AISearchMetaData> aiSearchMetaDatas;

  AiLoaded({required this.aiSearchMetaDatas});
}

class AiError extends AISearchState {}