// BugScreen is a page for unhandled routing issues and unimplemented pages

// imports
import 'dart:developer';
import 'package:flutter/material.dart';

class BugScreen extends StatelessWidget {
  // constructor
  const BugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return const Center(
        child: Icon(
          Icons.bug_report,
          size: 200,
        ),
      );
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
