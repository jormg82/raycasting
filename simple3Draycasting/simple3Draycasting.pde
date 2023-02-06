

// no ray can exceed this length inside the canvas
static final float maxRayLength = 1000;

static final int numRays = 200;
static final float FOV = radians(70);
static final float stepAngle = FOV / numRays;

ArrayList<Wall> walls;
Player player;

// framerate measuring
int frameMillis = 0;


void setup() {
  size(800, 600);
  loadFileWalls();

  player = new Player();
}


void draw() {
  background(0);

  //for (Wall wall : walls)
  //  wall.display();

  player.display();
  player.update();

  processFramerate();
}


// load list of walls from data/walls.txt
// each line contains four integers, corresponding
// to the coordinates of the ends of the wall
void loadFileWalls() {
  walls = new ArrayList<Wall>();

  String[] lines = loadStrings("walls.txt");

  for (String line : lines) {
    int[] nums = int(split(line, ' '));
    walls.add(new Wall(nums[0], nums[1], nums[2], nums[3]));
  }
}


void processFramerate() {
  int mill = millis();
  float time = mill - frameMillis;
  frameMillis = mill;
  int rate = int(1000.0 / time);

  textSize(32);
  text(str(rate), 5, 590);
}
