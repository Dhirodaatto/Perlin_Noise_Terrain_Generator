TerraGen camera;

void setup()
{
  size(1920, 1080, P3D);
  camera = new TerraGen(3200, 2100, 20, 0.1, 200, -100, 30);
}

void draw()
{
   camera.fly();
}
