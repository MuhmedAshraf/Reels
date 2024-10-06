import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Feature/01.Home/data/repo/videos_repo.dart';
import '../../../data/models/video_model.dart';
part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit({required this.repo}) : super(VideoInitial());

  final VideosRepo repo;


  Future<void>getReels()async{
    emit(VideoLoading());
    final response = await repo.getReels();
    response.fold(
          (failure) => emit(VideoFailure(errMessage: failure.errMessage)),
          (reels) => emit(VideoSuccess(reels: reels)),
    );
  }


}





