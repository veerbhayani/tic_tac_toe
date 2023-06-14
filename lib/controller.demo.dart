import 'package:flutter/material.dart';

bool oTurn = true;

List displayElement = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];

int oScore = 0;
int xScore = 0;
int filledBoxes = 0;

void tapped(int index, context) {
  if (oTurn && displayElement[index] == '') {
    displayElement[index] = 'O';
    filledBoxes++;
  } else if (!oTurn && displayElement[index] == '') {
    displayElement[index] = 'X';
    filledBoxes++;
  }

  oTurn = !oTurn;
  _checkWinner(context);
}

void _checkWinner(context) {
  // Checking rows
  if (displayElement[0] == displayElement[1] &&
      displayElement[0] == displayElement[2] &&
      displayElement[0] != '') {
    _showWinDialog(displayElement[0], context);
    clearBoard();
  }
  if (displayElement[3] == displayElement[4] &&
      displayElement[3] == displayElement[5] &&
      displayElement[3] != '') {
    _showWinDialog(displayElement[3], context);
    clearBoard();
  }
  if (displayElement[6] == displayElement[7] &&
      displayElement[6] == displayElement[8] &&
      displayElement[6] != '') {
    _showWinDialog(displayElement[6], context);
    clearBoard();
  }

  // Checking Column
  if (displayElement[0] == displayElement[3] &&
      displayElement[0] == displayElement[6] &&
      displayElement[0] != '') {
    _showWinDialog(displayElement[0], context);
    clearBoard();
  }
  if (displayElement[1] == displayElement[4] &&
      displayElement[1] == displayElement[7] &&
      displayElement[1] != '') {
    _showWinDialog(displayElement[1], context);
    clearBoard();
  }
  if (displayElement[2] == displayElement[5] &&
      displayElement[2] == displayElement[8] &&
      displayElement[2] != '') {
    _showWinDialog(displayElement[2], context);
    clearBoard();
  }

  // Checking Diagonal
  if (displayElement[0] == displayElement[4] &&
      displayElement[0] == displayElement[8] &&
      displayElement[0] != '') {
    _showWinDialog(displayElement[0], context);
    clearBoard();
  }
  if (displayElement[2] == displayElement[4] &&
      displayElement[2] == displayElement[6] &&
      displayElement[2] != '') {
    _showWinDialog(displayElement[2], context);
    clearBoard();
  } else if (filledBoxes == 9) {
    _showDrawDialog(context);
    clearBoard();
  }
}

void _showWinDialog(String winner, context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("\" $winner \" is Winner!!!"),
          actions: [
            TextButton(
              child: const Text("Play Again"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });

  if (winner == 'O') {
    oScore++;
  } else if (winner == 'X') {
    xScore++;
  }
}

void _showDrawDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Draw"),
          actions: [
            TextButton(
              child: const Text("Play Again"),
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
  for (int i = 0; i < 9; i++) {
    displayElement[i] = '';
  }

  filledBoxes = 0;
}

void clearScoreBoard() {
  xScore = 0;
  oScore = 0;
  for (int i = 0; i < 9; i++) {
    displayElement[i] = '';
  }

  filledBoxes = 0;
}
