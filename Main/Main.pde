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
        for (int i = 0; i < size; ++i) {
            for (int j = 0; j < size; ++j) {
                rect(i * cellWidth, j * cellWidth, cellWidth, cellWidth);
            }
        }
    }
    
    void displayPiece() {

    }
    
    Piece getPiece(int x, int y) {

    }

    void setPiece(int x,int y,Piece p){

    }

    void displayMoveableArea(int x,int y,int[][] move){

    }

    void movePiece(int x1,int y1,int x2,int y2){

    }

    void calcIndex(double mx,double my){

    }

    void capturePiece(int x,int y){

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
               return newPawn(x0, y0);
                
               case 1:
               return newBishiop(x0, y0);
                
               case 2:
               return newKnight(x0, y0);
                
               case 3:
               return newKing(x0, y0);
                
               case 4:
               return newQueen(x0, y0);
                
               case 5:
               return newRook(x0, y0);
                
                default :
                throw new IllegalArgumentException("type is an invalid value.");
        }
    }
}

class Pawn implements Piece {
    PImage img;
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
class Bishiop implements Piece {
    PImage img;
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
class Knight implements Piece {
    PImage img;
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
class King implements Piece {
    PImage img;
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
class Queen implements Piece {
    PImage = img;
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
class Rook implements Piece {
    PImage img;
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
    Map<string,int> capturedPecies = new HashMap<>();
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
