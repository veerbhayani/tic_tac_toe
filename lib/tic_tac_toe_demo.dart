import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controller.demo.dart';

class TicTacToeDemo extends StatefulWidget {
  const TicTacToeDemo({super.key});
  @override
  State<TicTacToeDemo> createState() => _TicTacToeDemoState();
}

class _TicTacToeDemoState extends State<TicTacToeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Player 0',
                        style: TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        oScore.toString(),
                        style: const TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Draw',
                        style: TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        drawScore.toString(),
                        style: const TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Player X',
                        style: TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        xScore.toString(),
                        style: const TextStyle(
                          fontFamily: 'Dancing Script',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index, context);
                      setState(() {});
                    },
                    child: Card(
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                        side: BorderSide(),
                      ),
                      color: color[index],
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: const TextStyle(
                            fontFamily: 'Dancing Script',
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.grey,
                    onPressed: () {
                      clearScoreBoard();
                      setState(() {});
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontFamily: 'Dancing Script',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    oTurn ? 'Player O' : 'Player X',
                    style: const TextStyle(
                      fontFamily: 'Dancing Script',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.grey,
                    onPressed: () {
                      clearBoard();
                      setState(() {});
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontFamily: 'Dancing Script',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
