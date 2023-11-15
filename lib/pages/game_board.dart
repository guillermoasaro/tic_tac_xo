import 'dart:math';

import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  final bool autoPlay;
  final bool isPlayerX;

  const GameBoard({super.key, this.autoPlay = true, this.isPlayerX = true});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<int> moves = [];

  @override
  void initState() {
    super.initState();
    resetMoves();
  }

  void resetMoves() {
    moves = [];
    if(!widget.isPlayerX && widget.autoPlay){
      nextAutoMove();
    }
  }

  String gameStatus(){
    String? winner = whoWon();
    if (winner != null){
      return 'Player $winner won!';
    }
    return 'Player ${moves.length.isEven ? "X" : "O"} it\'s your turn!';
  }

  String? whoWon() {
    return null;
  }

  void nextAutoMove() {
    var tryMove;
    print("PREV all moves $moves");
    if(moves.length < 9) {
      do {
        tryMove = Random().nextInt(9);
      } while(moves.contains(tryMove));
      moves.add(tryMove);
      print("PC MOVES $tryMove");
      print("POST all moves $moves");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac XO')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  // Logic to display 'X' or 'O' images
                  int moveIndex = moves.indexOf(index);
                  final imageAsset = moveIndex % 2 == 0 ? 'assets/cookie.png' : 'assets/donut.png';

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if(moveIndex < 0) {
                          setState(() {
                            moves.add(index);
                          });

                          if(widget.autoPlay) {
                            nextAutoMove();
                          }
                        }
                        print("cell tap $index");
                      },
                      child: moveIndex < 0 ? Container(color: Colors.grey,) : Image.asset(imageAsset),
                    ),
                  );
                },
              ),
            ),
            Text(
              gameStatus(),
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                print("Game was: $moves");
                setState(() {
                  resetMoves();
                });
              },
              child: const Text('NEW GAME'),
            ),
          ],
        ),
      ),
    );
  }
}
