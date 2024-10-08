import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import '../../../data/models/video_model.dart';

class VideoItem extends StatefulWidget {
  final VideoModel videoModel;

  const VideoItem({super.key, required this.videoModel});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late CachedVideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = CachedVideoPlayerController.network(widget.videoModel.video)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.value.isPlaying) {
          setState(() {
            controller.pause();
          });
        } else {
          setState(() {
            controller.play();
          });
        }
      },
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CachedVideoPlayer(controller),
      ),
    );
  }
}
