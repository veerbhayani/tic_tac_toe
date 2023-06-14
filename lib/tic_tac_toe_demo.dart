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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Player',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        '0',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Score ${oScore.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Player',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        'X',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Score ${xScore.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
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
                  return InkWell(
                    onTap: () {
                      tapped(index, context);
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        displayElement[index],
                        style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      clearScoreBoard();
                      setState(() {});
                    },
                    child: const Text(
                      'Clear Score Board',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      clearBoard();
                      setState(() {});
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 20,
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
