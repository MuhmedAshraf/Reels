import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Feature/01.Home/presentation/views/widgets/video_item.dart';
import '../../../../../Core/shared_widgets/error_widget.dart';
import '../../view_model/video_cubit/video_cubit.dart';

class ReelsBody extends StatelessWidget {
  const ReelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoSuccess) {
          return PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => VideoItem(videoModel: state.reels[i]),
            itemCount: state.reels.length,
            scrollDirection: Axis.vertical,
          );
        } else if (state is VideoFailure) {
          return ErrWidget(text: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
            ),
          );
        }
      },
    );
  }
}