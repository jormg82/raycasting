

// no ray can exceed this length inside the canvas
static final float maxRayLength = 1000;

static final int numRays = 200;
static final float FOV = radians(70);
static final float stepAngle = FOV / numRays;


ArrayList<Wall> walls;
Player player;


void setup() {
  size(800, 600);

  loadWalls();
  player = new Player();
}


void draw() {
  background(0);

  //for (Wall wall : walls)
  //  wall.display();

  player.display();
  player.update();
}


// load list of walls from data/walls.txt
// each line contains four integers, corresponding
// to the coordinates of the ends of the wall
void loadWalls() {
  walls = new ArrayList<Wall>();

  String[] lines = loadStrings("walls.txt");
  for (String line : lines) {
    int[] nums = int(split(line, ' '));
    walls.add(new Wall(nums[0], nums[1], nums[2], nums[3]));
  }
}
