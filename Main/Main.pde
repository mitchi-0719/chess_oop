abstract class Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int playerID;
  PImage img;

  abstract double[] calcMoveableArea(Piece[][] boardArray, int size);
  abstract void move(int x, int y);
}

class Pawn extends Piece {
  Pawn(int id) {
    if (id == 0) {
      img = loadImage("Pawn_white.png");
    } else {
      img = loadImage("Pawn_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move(int x, int y) {
  }
}

class Bishop extends Piece {
  Bishop(int id) {
    if (id == 0) {
      img = loadImage("Bishop_white.png");
    } else {
      img = loadImage("Bishop_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
  }

  void move(int x, int y) {
  }
}

class Knight extends Piece {
  Knight(int id) {
    if (id == 0) {
      img = loadImage("Knight_white.png");
    } else {
      img = loadImage("Knight_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  void move(int x, int y) {
  }
}

class King extends Piece {
  King(int id) {
    if (id == 0) {
      img = loadImage("King_white.png");
    } else {
      img = loadImage("King_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  void move(int x, int y) {
  }
}

class Queen extends Piece {
  Queen(int id) {
    if (id == 0) {
      img = loadImage("Queen_white.png");
    } else {
      img = loadImage("Queen_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  void move(int x, int y) {
  }
}

class Rook extends Piece {
  Rook(int id) {
    if (id == 0) {
      img = loadImage("Rook_white.png");
    } else {
      img = loadImage("Rook_black.png");
    }
    playerID = id;
  }

  double[] calcMoveableArea() {
    return new double[0]; // サンプル実装
  }

  void move(int x, int y) {
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
      return new Bishop(id);

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
    String p1 = "Player1", p2 = "Player2";
    int xp1 = 0, yp1 = 0, w = 200, h = 40;
    int xp2 = width-w, yp2 = height-h;

    int d = 100, num = 1;
    int x, y = height / 2 - 4 * d;
    int k = 100;

    PImage img[][] = new PImage[6][2];
    for (int i = 0; i <= 1; i++) {
      img[0][i] = new King(i).img;
      img[1][i] = new Queen(i).img;
      img[2][i] = new Rook(i).img;
      img[3][i] = new Bishop(i).img;
      img[4][i] = new Knight(i).img;
      img[5][i] = new Pawn(i).img;
    }
    String PieceName[] = new String[6];
    PieceName[0] = "King";
    PieceName[1] = "Queen";
    PieceName[2] = "Rook";
    PieceName[3] = "Bishop";
    PieceName[4] = "Knight";
    PieceName[5] = "Pawn";

    fill(0);
    rect(0, 0, width/2, height);
    fill(255);
    rect(width/2, 0, width/2, height);
    fill(255);
    rect(xp1, yp1, w, h);
    fill(0);
    rect(xp2, yp2, w, h);
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text(p1, xp1+100, yp1+25);
    fill(255);
    text(p2, xp2+100, yp2+25);

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

    for (int i = 0; i < 6; i++) {
      image(img[i][0], xp1, yp1+k-50, 100, 100);
      fill(255);
      text(PieceName[i], xp1+120, yp1+k);
      image(img[i][1], xp2, yp2-k, 100, 100);
      fill(0);
      text(PieceName[i], xp2+120, yp2-k+50);
      k += 100;
    }
  }

  void displayPiece() {
    int d = 100;
    int boardX = 200;
    int boardY = height / 2 - 4 * d;

    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        Piece p = boardArray[i][j];
        if (p != null) {

          int xPos = boardX + j * d;
          int yPos = boardY + i * d;

          image(p.img, xPos, yPos, d, d);
        }
      }
    }
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
  int now;

  Game() {
    user = new User[2];
    now = 0;
  }
  void next() {
    now = (now+1)%2;
  }
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
  board.displayPiece();
}
