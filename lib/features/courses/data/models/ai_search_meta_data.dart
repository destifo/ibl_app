class AISearchMetaData {
  final String? id;
  final String? name;
  final String? slug;
  final String? uniqueId;
  final String? description;
  final String? platformKey;
  final String? createdBy;
  final String? metadata;
  final String? llmName;
  final String? llmProvider;
  final String? profileImage;
  final String? proactiveMessage;
  
  const AISearchMetaData({  
    required this.id,
    required this.name,
    required this.slug,
    required this.uniqueId,
    required this.description,
    required this.platformKey,
    required this.createdBy,
    required this.metadata,
    required this.llmName,
    required this.llmProvider,
    required this.profileImage,
    required this.proactiveMessage,
  });

  factory AISearchMetaData.fromJson(Map<String, dynamic> json) {
    return AISearchMetaData(
      id: json["_source"]["id"].toString(),
      name: json["_source"]["name"],
      slug: json["_source"]["slug"],
      uniqueId: json["_source"]["unique_id"],
      description: json["_source"]["description"],
      platformKey: json["_source"]["platform_key"],
      createdBy: json["_source"]["created_by"],
      metadata: json["_source"]["metadata"],
      llmName: json["_source"]["llm_name"],
      llmProvider: json["_source"]["llm_provider"],
      profileImage: json["_source"]["profile_image"],
      proactiveMessage: json["_source"]["proactive_message"],
    );
  }
}