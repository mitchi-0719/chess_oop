class Mode {
  String start, chess, finish;
  int gameMode;
  int time;

  Mode() {
    start = "Start!!";
    chess = "Chess";
    time = 0;
    gameMode = 0;
  }

  void display(){
    time++;
    background(bgImage);
    if (gameMode == 0) {
      displayStart();
    } else if (gameMode == 1) {
      displayChess();
    }else if (gameMode == 2) {
      displayFinish();
    }
  }

  void displayStart(){
    textAlign(CENTER);
    textSize(150+cos(time));
    fill(255);
    text(chess, width/2, 300);

    textAlign(CENTER);
    int sx = width/2, sy = height-300;
    fill(255);
    if (mouseX > sx-120 && mouseX < sx+120 && mouseY > sy-60 && mouseY < sy) {
      textSize(100+cos(time));
      if (mousePressed) {
        gameMode = 1;
      }
    } else {
      textSize(120+cos(time));
    }
    text(start, sx, sy);
  }

  void displayChess(){
    board.displayBoard();
    board.displayPiece();
    if (game.selectedX != -1 && game.selectedY != -1) {
      board.displayMoveableArea(game.selectedX, game.selectedY, game.moveableArea);
    }
  }

  void displayFinish(){
    background(bgImage);
    finish = (ww == 0) ? "Player 2 Wins!" : "Player 1 Wins!";
    textAlign(CENTER, CENTER);
    textSize(150+cos(time));
    fill(255);
    text(finish, width / 2, height / 2);

    int sx = width/2, sy = 200;
    fill(255);
    if (mouseX > sx-120 && mouseX < sx+120 && mouseY > sy-60 && mouseY < sy) {
      textSize(100+cos(time));
      if (mousePressed) {
        gameMode = 1;
        game.reset();
      }
    } else {
      textSize(120+cos(time));
    }
    text("ReStart", sx, sy);
  }
}