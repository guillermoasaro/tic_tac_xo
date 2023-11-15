import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  final bool autoPlay;
  final bool isPlayerX;

  const GameBoard({super.key, this.autoPlay = true, this.isPlayerX = true});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool xPlayerTurn = true;

  @override
  void initState() {
    super.initState();
    //xPlayerTurn = widget.isPlayerX;
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
                  // TODO: Logic to display 'X' or 'O' images
                  final imageAsset =
                      index % 2 == 0 ? 'assets/cookie.png' : 'assets/donut.png';

                  return GestureDetector(
                    onTap: () {
                      print("cell tap");
                    },
                    child: Image.asset(imageAsset),
                  );
                },
              ),
            ),
            Text(
              'Player ${xPlayerTurn ? "X" : "O"} it\'s your turn!',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Reset the game (if needed)
              },
              child: const Text('NEW GAME'),
            ),
          ],
        ),
      ),
    );
  }
}
