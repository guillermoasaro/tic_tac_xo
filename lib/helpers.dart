import 'package:flutter/material.dart';

class Helpers {
  static void navigate({
    required BuildContext context,
    required Widget page,
    bool isReplacement = false,
  }) {
    if (isReplacement) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}
