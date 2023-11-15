import 'package:flutter/material.dart';
import 'package:tic_tac_xo/pages/game_board.dart';

import '../helpers.dart';

class SideSelectPage extends StatefulWidget {
  const SideSelectPage({super.key});

  @override
  State<SideSelectPage> createState() => _SideSelectPageState();
}

class _SideSelectPageState extends State<SideSelectPage> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tic Tac XO')),
        body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Pick Your Side", style: TextStyle(fontSize: 32)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/cookie.png", width: 100),
                        Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            setSelectedRadio(1);
                          },
                        ),
                        const Text("First")
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/donut.png", width: 100),
                        Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: Colors.blue,
                          onChanged: (val) {
                            setSelectedRadio(2);
                          },
                        ),
                        const Text("Second"),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => Helpers.navigate(
                        context: context,
                        page: GameBoard(isPlayerX: selectedRadio == 1)),
                    child: const Text("CONTINUE"))
              ],
            )));
  }
}
