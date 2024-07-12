abstract class Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int playerID;
  PImage img;

  abstract double[] calcMoveableArea();
  abstract void move();
}

class Pawn extends Piece {
  Pawn(int id) {
    img = loadImage("Pawn_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class Bishiop extends Piece {
  Bishiop(int id) {
    img = loadImage("Bishop_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class Knight extends Piece {
  Knight(int id) {
    img = loadImage("Knight_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class King extends Piece {
  King(int id) {
    img = loadImage("King_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class Queen extends Piece {
  Queen(int id) {
    img = loadImage("Queen_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class Rook extends Piece {
  Rook(int id) {
    img = loadImage("Rook_white.png");
    playerID = id;
  }

  @Override
    double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  @Override
    void move() {
    // サンプル実装
  }
}

class Board {
  int size = 8;
  int cellWidth = 100;
  Piece[][] boardArray = new Piece[size][size];

  String[] defaultBoard = {"Rook", "Knight", "Bishiop", "King", "Queen", "Bishiop", "Knight", "Rook"};

  Board() {
    for (int i = 0; i < size; ++i) {
      boardArray[i] = new Piece[size];
      for (int j = 0; j < size; ++j) {
        Piece p;
        if (i == 0) {
          boardArray[i][j] = getPiece(defaultBoard[j], 0);
        } else if (i == 1) {
          boardArray[i][j] = getPiece("Pawn", 0);
        } else if (i == size - 2) {
          boardArray[i][j] = getPiece("Pawn", 1);
        } else if (i == size - 1) {
          boardArray[i][j] = getPiece(defaultBoard[j], 1);
        } else {
          boardArray[i][j] = null;
        }
      }
    }
  }

  Piece getPiece(String type, int id) {
    switch(type) {
    case "Pawn":
      return new Pawn(id);

    case "Bishiop":
      return new Bishiop(id);

    case "Knight":
      return new Knight(id);

    case "King":
      return new King(id);

    case "Queen":
      return new Queen(id);

    case "Rook":
      return new Rook(id);

    default:
      throw new IllegalArgumentException("type is an invalid value.");
    }
  }

  void displayBoard() {
    int d = 100, num = 1;
    int x, y = height / 2 - 4 * d;
    for (int i = 0; i < 8; i++) {
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
    return null;
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

class User {
  HashMap<String, Integer> capturedPecies = new HashMap<>();
  boolean isAdvance;

  void useCapturedPieces(String type) {
  }
}

class Game {
  boolean isAdvancedTurn;
  User[] user;

  Game() {
    user = new User[2];
  }

  int state;
}

Game game;
Board board;

void setup() {
  size(1200, 800);
  game = new Game();
  board = new Board();
}

void draw() {
  board.displayBoard();
}
