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

  bool gameEnded(){
    if(whoWon() != null || moves.length >= 9) {
      showAlert();
      return true;
    }
    return false;
  }

  String gameStatusText(){
    String? winner = whoWon();
    if (winner != null){
      return 'Player $winner won!';
    } else if(moves.length >= 9) {
     return "Draw :/";
    }
    return 'Player ${moves.length.isEven ? "X" : "O"} it\'s your turn!';
  }

  String? whoWon() {
    // Win conditions
    List<String?> checks = [
      // Horizontals
      containsAll([0, 1, 2], moves),
      containsAll([3, 4, 5], moves),
      containsAll([6, 7, 8], moves),
      // Verticals
      containsAll([0, 3, 6], moves),
      containsAll([1, 4, 7], moves),
      containsAll([2, 5, 8], moves),
      // Diagonals
      containsAll([0, 4, 8], moves),
      containsAll([2, 4, 6], moves),
    ];

    return checks.nonNulls.firstOrNull;
  }

  // TODO: Refactor name and dry logic
  String? containsAll(List<int> list1, List<int> list2) {
    if (list1.every((element) {
        return list2.contains(element) && list2.indexOf(element).isEven;
      })
    ){
      return "X";
    }

    if (list1.every((element) {
      return list2.contains(element) && list2.indexOf(element).isOdd;
    })
    ){
      return "O";
    }
  }

  void processTap(int moveIndex, int index) {
    if(moveIndex < 0 && !gameEnded()) {
      setState(() {
        moves.add(index);
      });

      if(widget.autoPlay) {
        nextAutoMove();
      }
    }
  }

  void nextAutoMove() {
    int tryMove;
    if(moves.length < 9 && !gameEnded()) {
      do {
        tryMove = Random().nextInt(9);
      } while(moves.contains(tryMove));
      moves.add(tryMove);
      if(gameEnded()) {
        print("GAME ENDED");
      }
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
                        processTap(moveIndex, index);
                      },
                      child: moveIndex < 0 ? Container(color: Colors.grey,) : Image.asset(imageAsset),
                    ),
                  );
                },
              ),
            ),
            Text(
              gameStatusText(),
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

  // TODO: refactor win condition checking
  void showAlert() {
    var winner = whoWon();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Game over"),
            content: Text(winner != null ? "Player $winner won" : "It is just a draw"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Back"),
              )
            ],
          );
        });
    setState(() {});
  }
}
