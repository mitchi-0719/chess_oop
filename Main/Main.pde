class Board {
  int size = 8;
  int cellWidth = 100;
  Piece[][] boardArray = new Piece[size][];

  Board() {
    for (int i = 0; i < size; ++i) {
      boardArray[i] = new Piece[size];
    }
  }

  void displayBoard() {
    for (int i = 0; i < size; ++i) {
      for (int j = 0; j < size; ++j) {
        rect(i*cellWidth, j*cellWidth, cellWidth, cellWidth);
      }
    }
  }

  void displayPiece() {
  }

  void getPiece(int x, int y) {
  }
}


interface Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int x = 0;
  int y = 0;

  double[] calcMoveableArea();
  void move();

  static Piece create(int x0, int y0, int type) {
    switch(type) {
    case 0:
      return new Pawn(x0, y0);

    case 1:
      return new Bishiop(x0, y0);

    case 2:
      return new Knight(x0, y0);

    case 3:
      return new King(x0, y0);

    case 4:
      return new Queen(x0, y0);

    case 5:
      return new Rook(x0, y0);

    default :
      throw new IllegalArgumentException("type is an invalid value.");
    }
  }
}

class Pawn implements Piece {
  int x, y;

  Pawn(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Bishiop implements Piece {

  Bishiop(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Knight implements Piece {

  Knight(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class King implements Piece {

  King(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Queen implements Piece {

  Queen(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}
class Rook implements Piece {

  Rook(int x0, int y0) {
    x = x0;
    y = y0;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

void setup() {
  size(800, 800);
}

void draw() {
  
}
