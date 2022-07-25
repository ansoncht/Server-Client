// LoadingScreen is a page to show a loading indicator

// imports
import 'dart:developer';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  // constructor
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          const Positioned.fill(
              child: Icon(
            Icons.emoji_emotions,
            color: Colors.yellow,
            size: 200,
          )),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 6.5,
                    child: const CircularProgressIndicator(
                        color: Colors.pink, strokeWidth: 3),
                  ))),
        ],
      );
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
