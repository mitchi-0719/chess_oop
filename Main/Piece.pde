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