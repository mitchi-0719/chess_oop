class Board {
  Piece[][] boardArray;
  int size = 8;

  Board() {
    boardArray = new Piece[size][size];
    initializePieces();
  }

  void initializePieces() {
    for (int i = 0; i < size; i++) {
      boardArray[1][i] = new Pawn(0);
      boardArray[6][i] = new Pawn(1);
    }

    boardArray[0][0] = new Rook(0);
    boardArray[0][7] = new Rook(0);
    boardArray[7][0] = new Rook(1);
    boardArray[7][7] = new Rook(1);

    boardArray[0][1] = new Knight(0);
    boardArray[0][6] = new Knight(0);
    boardArray[7][1] = new Knight(1);
    boardArray[7][6] = new Knight(1);

    boardArray[0][2] = new Bishop(0);
    boardArray[0][5] = new Bishop(0);
    boardArray[7][2] = new Bishop(1);
    boardArray[7][5] = new Bishop(1);

    boardArray[0][3] = new Queen(0);
    boardArray[7][3] = new Queen(1);

    boardArray[0][4] = new King(0);
    boardArray[7][4] = new King(1);
  }

  void reset() {
    for (int i= 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        boardArray[i][j] = null;
      }
    }
    initializePieces();
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
    if (x >= 0 && x < size && y >= 0 && y < size) {
      return boardArray[x][y];
    }
    return null;
  }

  void setPiece(int x, int y, Piece p) {
    if (x >= 0 && x < size && y >= 0 && y < size) {
      boardArray[x][y] = p;
    }
  }

  void displayMoveableArea(int x, int y, int[][] move) {
    int d = 100;
    int boardX = 200;
    int boardY = height / 2 - 4 * d;

    fill(255, 0, 0, 127);
    for (int[] m : move) {
      if (m[0] != -1 || m[1] != -1) {
        int xPos = boardX + m[1] * d + d / 2;
        int yPos = boardY + m[0] * d + d / 2;
        ellipse(xPos, yPos, d / 2, d / 2);
      }
    }
  }

  void movePiece(int x1, int y1, int x2, int y2) {
    Piece p = getPiece(x1, y1);
    if (p != null) {
      setPiece(x2, y2, p instanceof Pawn ? ((Pawn) p).promote(x2, y2) : p);
      setPiece(x1, y1, null);
    }
  }
}