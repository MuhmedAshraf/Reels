import 'package:flutter/material.dart';
import 'package:reels/Feature/01.Home/presentation/views/widgets/reels_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ReelsBody(),
      ),
    );
  }
}
