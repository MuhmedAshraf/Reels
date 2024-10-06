part of 'video_cubit.dart';

class VideoState {}

class VideoInitial extends VideoState {}

class VideoSuccess extends VideoState {
  final List<VideoModel> reels;

  VideoSuccess({required this.reels, isPlaying = false});
}

class VideoLoading extends VideoState {}

class VideoFailure extends VideoState {
  final String errMessage;

  VideoFailure({required this.errMessage});
}
