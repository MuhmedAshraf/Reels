import 'package:dartz/dartz.dart';
import 'package:reels/Core/errors/failure.dart';
import 'package:reels/Feature/01.Home/data/models/video_model.dart';

abstract class VideosRepo{
  Future<Either<Failure, List<VideoModel>>> getReels();
}