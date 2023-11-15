import 'package:flutter/material.dart';
import 'package:tic_tac_xo/pages/game_board.dart';
import 'package:tic_tac_xo/pages/side_select_page.dart';

import '../helpers.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/logo.png"),
              const Column(
                children: [
                  PlayerSelectionButton(text: "SINGLE PLAYER", isSingle: true,),
                  SizedBox(height: 20),
                  PlayerSelectionButton(text: "WITH A FRIEND", isSingle: false,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerSelectionButton extends StatelessWidget {
  final String text;
  final bool isSingle;

  const PlayerSelectionButton({
    super.key,
    this.isSingle = false,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>  Helpers.navigate(context: context, page: isSingle ? const SideSelectPage() : const GameBoard(autoPlay: false)),
      child: Text(text)
    );
  }
}
