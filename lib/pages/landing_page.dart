import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.4,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/logo.png'))),
            child:  Padding(padding: EdgeInsets.all(8.0),)));
  }
}
