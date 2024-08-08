PImage bgImage;
int ww;

Game game;
Board board;
Mode mode;

void setup() {
  size(1200, 800);
  game = new Game();
  board = new Board();
  mode = new Mode();
  bgImage = loadImage("background.jpeg");
  bgImage.resize(1200, 800);
}

void draw() {
  mode.display();
}

void mouseClicked() {
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
