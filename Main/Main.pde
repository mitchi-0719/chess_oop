int gamemode = 1;
PImage bgImage;
int ww;

Game game;
Board board;
Mode s1, s2;

void setup() {
  size(1200, 800);
  game = new Game();
  board = new Board();
  s1 = new ModeStart();
  s2 = new ModeChess();
  bgImage = loadImage("background.jpeg");
  bgImage.resize(1200, 800);
}

void draw() {
  if (gamemode == 2) {
    background(bgImage);
    String winner = (ww == 0) ? "Player 2 Wins!" : "Player 1 Wins!";
    textAlign(CENTER, CENTER);
    textSize(150);
    fill(255);
    text(winner, width / 2, height / 2);
    s1.restart();
    s1.time += 1;
  } else if (gamemode == 1) {
    background(bgImage);
    s1.display();
    s2.time += 1;
    s1.time += 1;
    s2.display();
  } else {
    board.displayBoard();
    board.displayPiece();
    if (game.selectedX != -1 && game.selectedY != -1) {
      board.displayMoveableArea(game.selectedX, game.selectedY, game.moveableArea);
    }
  }
}

void mousePressed() {
  int d = 100;
  int boardX = 200;
  int boardY = height / 2 - 4 * d;

  int x = (mouseY - boardY) / d;
  int y = (mouseX - boardX) / d;

  if (x >= 0 && x < 8 && y >= 0 && y < 8) {
    if (game.selectedX == -1 && game.selectedY == -1) {
      game.selectPiece(x, y);
    } else {
      game.movePiece(x, y);
    }
  }
}
