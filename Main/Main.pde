abstract class Piece {
  boolean isUsed = true;
  boolean isClicked = false;
  int playerID;
  PImage img;

  abstract int[][] calcMoveableArea(int x, int y, Piece[][] boardArray);
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[4][2];
    int dir = (playerID == 0) ? 1 : -1;
    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }
    if (x + dir >= 0 && x + dir < boardArray.length && boardArray[x + dir][y] == null) {
      moves[0][0] = x + dir;
      moves[0][1] = y;
    }
    if ((playerID == 0 && x == 1) || (playerID == 1 && x == 6)) {
      if (boardArray[x + dir][y] == null && boardArray[x + 2 * dir][y] == null) {
        moves[1][0] = x + 2 * dir;
        moves[1][1] = y;
      }
    }

    if (x + dir >= 0 && x + dir < boardArray.length) {
      if (y - 1 >= 0 && boardArray[x + dir][y - 1] != null && boardArray[x + dir][y - 1].playerID != playerID) {
        moves[2][0] = x + dir;
        moves[2][1] = y - 1;
      }
      if (y + 1 < boardArray.length && boardArray[x + dir][y + 1] != null && boardArray[x + dir][y + 1].playerID != playerID) {
        moves[3][0] = x + dir;
        moves[3][1] = y + 1;
      }
    }

    return moves;
  }

  Piece promote(int x, int y) {
    if ((playerID == 0 && x == 7) || (playerID == 1 && x == 0)) {
      return new Queen(playerID);
    }
    return this;
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[14][2];
    int index = 0;

    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }

    int[] dx = {-1, -1, 1, 1};
    int[] dy = {-1, 1, -1, 1};

    for (int d = 0; d < 4; d++) {
      int nx = x + dx[d];
      int ny = y + dy[d];
      while (nx >= 0 && nx < boardArray.length && ny >= 0 && ny < boardArray.length) {
        if (boardArray[nx][ny] == null) {
          moves[index][0] = nx;
          moves[index][1] = ny;
          index++;
        } else {
          if (boardArray[nx][ny].playerID != playerID) {
            moves[index][0] = nx;
            moves[index][1] = ny;
            index++;
          }
          break;
        }
        nx += dx[d];
        ny += dy[d];
      }
    }

    return moves;
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[8][2];
    int[][] possibleMoves = {{-2, -1}, {-2, 1}, {-1, -2}, {-1, 2}, {1, -2}, {1, 2}, {2, -1}, {2, 1}};

    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }

    int index = 0;
    for (int[] pm : possibleMoves) {
      int nx = x + pm[0];
      int ny = y + pm[1];
      if (nx >= 0 && nx < boardArray.length && ny >= 0 && ny < boardArray.length) {
        if (boardArray[nx][ny] == null || boardArray[nx][ny].playerID != playerID) {
          moves[index][0] = nx;
          moves[index][1] = ny;
          index++;
        }
      }
    }

    return moves;
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[8][2];
    int[][] possibleMoves = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};

    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }

    int index = 0;
    for (int[] pm : possibleMoves) {
      int nx = x + pm[0];
      int ny = y + pm[1];
      if (nx >= 0 && nx < boardArray.length && ny >= 0 && ny < boardArray.length) {
        if (boardArray[nx][ny] == null || boardArray[nx][ny].playerID != playerID) {
          moves[index][0] = nx;
          moves[index][1] = ny;
          index++;
        }
      }
    }

    return moves;
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[27][2];
    int index = 0;

    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }

    int[] dx = {-1, -1, -1, 0, 0, 1, 1, 1};
    int[] dy = {-1, 0, 1, -1, 1, -1, 0, 1};

    for (int d = 0; d < 8; d++) {
      int nx = x + dx[d];
      int ny = y + dy[d];
      while (nx >= 0 && nx < boardArray.length && ny >= 0 && ny < boardArray.length) {
        if (boardArray[nx][ny] == null) {
          moves[index][0] = nx;
          moves[index][1] = ny;
          index++;
        } else {
          if (boardArray[nx][ny].playerID != playerID) {
            moves[index][0] = nx;
            moves[index][1] = ny;
            index++;
          }
          break;
        }
        nx += dx[d];
        ny += dy[d];
      }
    }

    return moves;
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

  int[][] calcMoveableArea(int x, int y, Piece[][] boardArray) {
    int[][] moves = new int[14][2];
    int index = 0;

    for (int i = 0; i < moves.length; i++) {
      moves[i][0] = -1;
      moves[i][1] = -1;
    }

    int[] dx = {-1, 1, 0, 0};
    int[] dy = {0, 0, -1, 1};

    for (int d = 0; d < 4; d++) {
      int nx = x + dx[d];
      int ny = y + dy[d];
      while (nx >= 0 && nx < boardArray.length && ny >= 0 && ny < boardArray.length) {
        if (boardArray[nx][ny] == null) {
          moves[index][0] = nx;
          moves[index][1] = ny;
          index++;
        } else {
          if (boardArray[nx][ny].playerID != playerID) {
            moves[index][0] = nx;
            moves[index][1] = ny;
            index++;
          }
          break;
        }
        nx += dx[d];
        ny += dy[d];
      }
    }

    return moves;
  }
}


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


class Game {
  boolean isAdvancedTurn;
  int now;
  int selectedX = -1;
  int selectedY = -1;
  int[][] moveableArea = new int[0][0];

  Game() {
    now = 0;
  }

  void next() {
    now = (now + 1) % 2;
  }

  void selectPiece(int x, int y) {
    Piece selectedPiece = board.getPiece(x, y);
    if (selectedPiece != null && selectedPiece.playerID == now) {
      selectedX = x;
      selectedY = y;
      moveableArea = selectedPiece.calcMoveableArea(x, y, board.boardArray);
    } else {
      selectedX = -1;
      selectedY = -1;
      moveableArea = new int[0][0];
    }
  }

  void movePiece(int x, int y) {
    for (int[] move : moveableArea) {
      if (move[0] == x && move[1] == y) {
        Piece targetPiece = board.getPiece(x, y);
        if (targetPiece instanceof King) {
          if (targetPiece.playerID == now) {
            return;
          }
          ww = (now == 0) ? 1 : 0;
          gamemode = 2;
          board.movePiece(selectedX, selectedY, x, y);
          return;
        }
        board.movePiece(selectedX, selectedY, x, y);
        next();
        break;
      }
    }
    selectedX = -1;
    selectedY = -1;
    moveableArea = new int[0][0];
  }


  void reset() {
    board.reset();
    now = 0;
    selectedX = -1;
    selectedY = -1;
    moveableArea = new int[0][0];
  }
}

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
