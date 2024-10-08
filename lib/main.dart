import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Core/api_helper/dio_consumer.dart';
import 'package:reels/Feature/01.Home/data/repo/videos_repo_implement.dart';
import 'package:reels/Feature/01.Home/presentation/view_model/video_cubit/video_cubit.dart';
import 'package:reels/Feature/01.Home/presentation/views/home_screen.dart';

void main() {
  runApp(const Reals());
}

class Reals extends StatelessWidget {
  const Reals({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(repo: VideosRepoImplement(api: DioConsumer(dio: Dio())))..getReels(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.dev/assets/videos/player/sample_video.mp4');
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Player Example'),
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
