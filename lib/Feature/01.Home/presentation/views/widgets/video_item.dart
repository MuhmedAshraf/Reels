import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Feature/01.Home/presentation/view_model/video_cubit/video_cubit.dart';
import 'package:video_player/video_player.dart';
import '../../../data/models/video_model.dart';

class VideoItem extends StatefulWidget {
  final VideoModel videoModel;

  const VideoItem({super.key, required this.videoModel});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.videoModel.video)
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
        child: VideoPlayer(controller),
      ),
    );
  }
}
