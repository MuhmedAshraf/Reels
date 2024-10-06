class VideoModel {
  final String video;

  VideoModel({
    required this.video,
  });

  factory VideoModel.fromJson(Map<String, dynamic> jsonData) {
    return VideoModel(
      video: jsonData['video'],
    );
  }
}
