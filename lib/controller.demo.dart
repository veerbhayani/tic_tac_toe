import 'package:flutter/material.dart';

bool oTurn = true;
List displayElement = List.generate(9, (index) => '');
int oScore = 0;
int xScore = 0;
int filledBoxes = 0;
int drawScore = 0;
List<Color> color = List.generate(9, (index) => Colors.grey);

void tapped(int index, context) {
  if (oTurn && displayElement[index] == '') {
    displayElement[index] = 'O';
    filledBoxes++;
    color[index] = Colors.red;
  } else if (!oTurn && displayElement[index] == '') {
    displayElement[index] = 'X';
    filledBoxes++;
    color[index] = Colors.blueAccent;
  }
  oTurn = !oTurn;
  checkWinner(context);
}

void checkWinner(context) {
  if (displayElement[0] == displayElement[1] &&
          displayElement[0] == displayElement[2] &&
          displayElement[0] != '' ||
      displayElement[3] == displayElement[4] &&
          displayElement[3] == displayElement[5] &&
          displayElement[3] != '' ||
      displayElement[6] == displayElement[7] &&
          displayElement[6] == displayElement[8] &&
          displayElement[6] != '' ||
      displayElement[0] == displayElement[3] &&
          displayElement[0] == displayElement[6] &&
          displayElement[0] != '' ||
      displayElement[1] == displayElement[4] &&
          displayElement[1] == displayElement[7] &&
          displayElement[1] != '' ||
      displayElement[2] == displayElement[5] &&
          displayElement[2] == displayElement[8] &&
          displayElement[2] != '' ||
      displayElement[2] == displayElement[4] &&
          displayElement[2] == displayElement[6] &&
          displayElement[2] != '' ||
      displayElement[0] == displayElement[4] &&
          displayElement[0] == displayElement[8] &&
          displayElement[0] != '') {
    showWinDialog(context);
    clearBoard();
  } else if (filledBoxes == 9) {
    showDrawDialog(context);
    drawScore++;
    clearBoard();
  }
}

void showWinDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            !oTurn ? "Player X is Winner" : 'Player O is Winner',
            style: const TextStyle(
              fontFamily: 'Dancing Script',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                "Play Again",
                style: TextStyle(
                  fontFamily: 'Dancing Script',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });

  (!oTurn) ? ((oScore++), (oTurn = !oTurn)) : ((xScore++), (oTurn = !oTurn));
}

void showDrawDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Draw",
            style: TextStyle(
              fontFamily: 'Dancing Script',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                "Play Again",
                style: TextStyle(
                  fontFamily: 'Dancing Script',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

void clearBoard() {
  displayElement = List.generate(9, (index) => '');
  color = List.generate(9, (index) => Colors.grey);
  filledBoxes = 0;
}

void clearScoreBoard() {
  xScore = 0;
  oScore = 0;
  drawScore = 0;
  color = List.generate(9, (index) => Colors.grey);
  displayElement = List.generate(9, (index) => '');
  filledBoxes = 0;
}
