class Board {
  int size = 8;
  int cellWidth = 100;
  Piece[][] boardArray = new Piece[size][];
    
    String [] defaultBoard = {"Rook","Knight","Bishop","King","Queen","Bishop","Knight","Rook"};

  Board() {
    for (int i = 0; i < size; ++i) {
      boardArray[i] = new Piece[size];
    }
  }

  void displayBoard() {
    int d = 100, num = 1;
    int x, y = height/2-4*d;
    for (int i = 0; i <  8; i++) {
      x = 200;
      for (int j = 0; j < 8; j++) {
        noStroke();
        if (num % 2 == 0) {
          fill(169);
        } else {
          fill(245, 222, 179);
        }
        rect(x, y, d, d);
        x += d;
        num++;
      }
      y += d;
      num++;
    }
  }

  void displayPiece() {
  }

  Piece getPiece(int x, int y) {
  }

  void setPiece(int x, int y, Piece p) {
  }

  void displayMoveableArea(int x, int y, int[][] move) {
  }

  void movePiece(int x1, int y1, int x2, int y2) {
  }

  void calcIndex(double mx, double my) {
  }

  void capturePiece(int x, int y) {
  }
}


abstract class Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int x = 0;
  int y = 0;
  PImage img;

  double[] calcMoveableArea();
  void move();

  static Piece create(int x0, int y0, String type,int id) {
    switch(type) {
    case Pawn:
      return Pawn(x0, y0,id);

    case Bishiop:
      return Bishiop(x0, y0,id);

    case Knight:
      return Knight(x0, y0,id);

    case King:
      return King(x0, y0,id);

    case Queen:
      return Queen(x0, y0,id);

    case Rook:
      return Rook(x0, y0,id);

    default :
      throw new IllegalArgumentException("type is an invalid value.");
    }
  }
}

class Pawn extends Piece {

  Pawn(int x0, int y0) {
    img = loadImage("Pawn_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Bishiop extends Piece {

  Bishiop(int x0, int y0) {
    img = loadImage("Bishop_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Knight extends Piece {

  Knight(int x0, int y0) {
    img = loadImage("Knight_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class King extends Piece {

  King(int x0, int y0) {
    img = loadImage("King_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Queen extends Piece {
  
  Queen(int x0, int y0) {
    img = loadImage("Queen_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Rook extends Piece {

  Rook(int x0, int y0) {
    img = loadImage("Rook_white.png");
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class User() {
  Map<string, int> capturedPecies = new HashMap<>();
  boolean isAdvance;

  void useCapturedPieces(string type) {
  }
}


class Game() {
  boolean isAdvancedTurn;
  User u[];
  u = new User[2];

  int state;
}
void setup() {
  size(800, 800);
}

void draw() {
}
