abstract class Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int playerID;
  PImage img;

  double[] calcMoveableArea();
  void move();

  static Piece create(String type, int id) {
    switch(type) {
    case "Pawn":
      return Pawn(id);

    case "Bishiop":
      return Bishiop(id);

    case "Knight":
      return Knight(id);

    case "King":
      return King(id);

    case "Queen":
      return Queen(id);

    case "Rook":
      return Rook(id);

    default :
      throw new IllegalArgumentException("type is an invalid value.");
    }
  }
}

class Pawn extends Piece {

  Pawn(int id) {
    img = loadImage("Pawn_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class Bishiop extends Piece {

  Bishiop(int id) {
    img = loadImage("Bishop_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class Knight extends Piece {

  Knight(int id) {
    img = loadImage("Knight_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class King extends Piece {

  King(int id) {
    img = loadImage("King_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class Queen extends Piece {

  Queen(int id) {
    img = loadImage("Queen_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class Rook extends Piece {

  Rook(int id) {
    img = loadImage("Rook_white.png");
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move() {
  }
}

class Board {
  int size = 8;
  int cellWidth = 100;
  Piece[][] boardArray = new Piece[size][];

  String [] defaultBoard = {"Rook", "Knight", "Bishop", "King", "Queen", "Bishop", "Knight", "Rook"};

  Board() {
    for (int i = 0; i < size; ++i) {
      boardArray[i] = new Piece[size];
      for (int j = 0; j < size; ++j) {
        if (i == 0) {
          boardArray[i][j] = Piece.create(defaultBoard[j], 0);
        } else if (i == 2) {
          boardArray[i][j] = Piece.create("Pawn", 0);
        } else if (i == size-2) {
          boardArray[i][j] = Piece.create("Pawn", 1);
        } else if (i == size-1) {
          boardArray[i][j] = Piece.create(defaultBoard[j], 1);
        } else {
          boardArray[i][j] = null;
        }
      }
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
