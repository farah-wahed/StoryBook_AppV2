class StoryData {
  String? storyID;
  final String title;
  final String description;
  final String imageUrl;
  bool isFavorite;
  String userId;

  StoryData({
    this.storyID,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    required this.userId,
  });

  factory StoryData.fromFirestore(Map<String, dynamic> json) {
    return StoryData(
      storyID: json["storyID"],
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      isFavorite: json["isFavorite"] ?? false,
      userId: json["userId"] ?? "",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "storyID": storyID,
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "isFavorite": isFavorite,
      "userId": userId,
    };
  }
}