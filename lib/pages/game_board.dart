import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

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
            const Text(
              'Player X it\'s your turn!', // TODO: Replace with real player turn
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Reset the game (if needed)
              },
              child: const Text('New Game'),
            ),
          ],
        ),
      ),
    );
  }
}
