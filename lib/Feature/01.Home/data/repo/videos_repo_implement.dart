import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reels/Core/api_helper/api_consumer.dart';
import 'package:reels/Core/errors/failure.dart';
import 'package:reels/Feature/01.Home/data/models/video_model.dart';
import 'package:reels/Feature/01.Home/data/repo/videos_repo.dart';

class VideosRepoImplement extends VideosRepo {
  final ApiConsumer api;

  VideosRepoImplement({required this.api});

  @override
  Future<Either<Failure, List<VideoModel>>> getReels() async {
    try {
      final response = await api.get('reels');
      List<VideoModel> videos = [];
      for (var item in response['data']) {
        videos.add(VideoModel.fromJson(item));
      }
      return Right(videos);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
