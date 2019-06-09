int mh = 150, mv = 150;
int sh = 50, sv = 50;
int nr = 10, nc = 10;

Point[][] grid;

float ns = 0.3;


void setup() {
  
    size(800, 800);
    stroke(0, 0, 0);
    background(255, 255, 255);
    
    grid = new Point[nc+1][nr+1];
    for(int i = 0; i < nr+1; i++) {
        for (int j = 0; j < nc+1; j++) {
            Point p = new Point(mv+i*sh, mh+j*sv); 
            if (i != 0) p.con.add(grid[i-1][j]);
            if (j != 0) p.con.add(grid[i][j-1]);
            grid[i][j] = p;
        }
    }
    
}

void draw() {
  
    background(255, 255, 255);

    for(int i = 0; i < nr+1; i++) {
        for (int j = 0; j < nc+1; j++) {
          
            // if (i == j || i == 10 || j == 10 || i == 0 || j == 0) ns = 0.01;
            // else ns = 0.2;
                        
            float nx = noise(grid[i][j].x, grid[i][j].y);
            float sx = random(-1, 1);            
            if (sx < 0) nx = -nx;
            grid[i][j].x = grid[i][j].x + nx * ns;
            
            float ny = noise(grid[i][j].x, grid[i][j].y);
            float sy = random(-1, 1);            
            if (sy < 0) ny = -ny;
            grid[i][j].y = grid[i][j].y + ny * ns;
            
            point(grid[i][j].x, grid[i][j].y);
            
            // LINE GRID
            for(Point c : grid[i][j].con) {
                line(grid[i][j].x, grid[i][j].y, c.x, c.y);
            }
            
            // TRIANGLE GRID
            // if (grid[i][j].r) fill(0, 0, 0);
            // else fill(255, 255, 255);
            // if (grid[i][j].con.size() == 2) {
            //     Point c1 = grid[i][j].con.get(0);
            //     Point c2 = grid[i][j].con.get(1);
            //     triangle(grid[i][j].x, grid[i][j].y, c1.x, c1.y, c2.x, c2.y);
            // } else if (grid[i][j].con.size() == 1) {
            //     Point c = grid[i][j].con.get(0);
            //     line(grid[i][j].x, grid[i][j].y, c.x, c.y);
            // }
            
        }
    }

}

void keyPressed() {
    saveFrame("noise_grid-######.png");
}

class Point { 

    float x; 
    float y;
    boolean r = random(-1, 1) > 0;
    ArrayList<Point> con;
    
    Point (float x, float y) { 
        this.x = x; 
        this.y = y;
        this.con = new ArrayList<Point>();
    }

}
