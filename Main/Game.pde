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