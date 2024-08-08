abstract class Mode {
  String start, chess;
  int time;
  abstract void display();
  abstract void restart();
}

class ModeStart extends Mode {
  ModeStart() {
    start = "Start!!";
    time = 0;
  }

  void display() {
    textAlign(CENTER);
    int sx = width/2, sy = height-300;
    fill(255);
    if (mouseX > sx-120 && mouseX < sx+120 && mouseY > sy-60 && mouseY < sy) {
      textSize(100+cos(time));
      if (mousePressed) {
        gamemode = 0;
      }
    } else {
      textSize(120);
    }
    text(start, sx, sy);
  }

  void restart() {
    if (gamemode == 2) {
      textAlign(CENTER);
      int sx = width/2, sy = 200;
      fill(255);
      if (mouseX > sx-120 && mouseX < sx+120 && mouseY > sy-60 && mouseY < sy) {
        textSize(100+cos(time));
        if (mousePressed) {
          gamemode = 1;
          game.reset();
        }
      } else {
        textSize(120);
      }
      text("ReStart", sx, sy);
    }
  }
}

class ModeChess extends Mode {
  ModeChess() {
    chess = "Chess";
    time = 0;
  }
  void display() {
    textAlign(CENTER);
    textSize(150+sin(time));
    fill(255);
    text(chess, width/2, 300);
  }
  void restart() {
  }
}