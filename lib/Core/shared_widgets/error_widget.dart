import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        content: Text(text),
        scrollable: true,
      ),
    );
  }
}
