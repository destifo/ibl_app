import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibl_app/features/courses/data/models/ai_search_meta_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AiDetailScreen extends StatelessWidget {
  final AISearchMetaData aiSearchMetaData;

  const AiDetailScreen({super.key, required this.aiSearchMetaData});

  // Define constants for responsive sizes
  static const double paddingSize = 16.0;
  static const double titleFontSize = 18.0;
  static const double descriptionFontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Detail'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${aiSearchMetaData.name}',
                    style: TextStyle(
                      fontSize: titleFontSize.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CachedNetworkImage(
                    imageUrl: aiSearchMetaData.profileImage!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Description: ${aiSearchMetaData.description}',
                    style: TextStyle(fontSize: descriptionFontSize.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'LLM Provider: ${aiSearchMetaData.llmProvider}',
                    style: TextStyle(fontSize: descriptionFontSize.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Proactive message: ${aiSearchMetaData.proactiveMessage}',
                    style: TextStyle(fontSize: descriptionFontSize.sp),
                  ),
                  // Add more details as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
