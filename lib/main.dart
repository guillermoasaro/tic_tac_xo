import 'package:flutter/material.dart';
import 'package:tic_tac_xo/pages/game_board.dart';
import 'package:tic_tac_xo/pages/landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TicTacXOApp());
}

class TicTacXOApp extends StatelessWidget {
  const TicTacXOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac XO',
      home: GameBoard()
    );
  }
}
