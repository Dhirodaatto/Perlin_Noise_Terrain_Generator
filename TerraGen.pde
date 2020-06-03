

public class TerraGen
{
  int w;
  int h;
  int rows, cols;
  int scale;
  int max_height, max_depth;
  int fps;
  float flight_offset;

  float[][] noise_val;
  float flight_speed = 0;
  TerraGen(int w, int h, int scale, float flight_offset, int max_height, int max_depth, int fps)
  {
    this.fps = fps;
    this.w = w;
    this.h = h;
    this.scale = scale;
    this.flight_offset = flight_offset;
    this.max_height = max_height;
    this.max_depth = max_depth;
    
    rows = h/scale;
    cols = w/scale;
    noise_val = new float[rows][cols];
  
    frameRate(fps);
  }
  
  
  void fly()
  {
    float y_offset = flight_speed;
   for(int y = 0; y < rows; y++) {
     float x_offset = 0;
      for(int x = 0; x < cols ; x++) {
          
          noise_val[y][x] = map(noise(x_offset,y_offset), 0, 1, max_depth, max_height);
          x_offset += 0.1;
      }
    y_offset -= 0.1;
  }
  
  flight_speed += flight_offset;
  
  background(255);
  noFill();
  stroke(0);
  
  
  translate(width/2, height/2);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  for(int y = 0; y < rows-1; y++) {
    
    beginShape(TRIANGLE_STRIP);
    
    for(int x = 0;x < cols; x++) {
            //color a = color(random(0, 255), random(0, 255), random(0, 255));
            //stroke(a);
            vertex(x*scale, y*scale, noise_val[y][x]);
            vertex(x*scale, (y + 1)*scale, noise_val[y+1][x]);
      
    }
    endShape();
  }
  }
}
