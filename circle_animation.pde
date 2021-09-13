float x,y;
float time = 0;
int size = 300;

public class ball
{

  float angle;
  PVector pos;
  float offset;
  color thing;

  //-------

  void axis()
  {
    line( x0(-cos(angle)*size) , y0(-sin(angle)*size) , x0(cos(angle)*size) , y0(sin(angle)*size) );
  }

  float H_TIME(float t)
  {
    return (sin(t)*cos(angle));
  }

  float F_HEIGHT(float a)
  {
    return (tan(angle)*a);
  }

  void display()
  {
    pos = new PVector ( x0(H_TIME(time+offset) * size)   , y0(F_HEIGHT(H_TIME(time+offset)) * size )   );
  }

}

ball[] test;

void setup()
{
  size(900,900, P2D);
  surface.setResizable(true);
  frameRate(1000);
  test = new ball[100];

  for (int i = 0; i < test.length; i++) {
    test[i] = new ball();
    test[i].thing = color(255, random(255), random(255));
    test[i].angle = (PI/2)+(-(PI/test.length)*i);
    test[i].offset = (PI/test.length)*i;
  }
}

void draw()
{
  for (int i = 0; i < test.length; i++) {
    test[i].display();
  }
  background(255);
  time += 1/frameRate;
  fill(255);
  stroke(117);
  ellipse( x0(0) , y0(0) , 2*size, 2*size);

  //Axis
  for (int i = 0; i < test.length; i++) {
    test[i].axis();
  }

  fill(0);
  stroke(0);
  circle( x0(cos(time)*size), y0(sin(time)*size)  ,10);

  for (int i = 0; i < test.length; i++) {
    fill(test[i].thing);
    circle(test[i].pos.x, test[i].pos.y, size/60);
  }
  fill(0);
  text("fps: " + frameRate, 10, 10);
  text("time: " + time, 10, 20);
}

float x0(float TEMP_X)
{
  return((width/2) + TEMP_X);
}

float y0(float TEMP_Y)
{
  return((height/2) + TEMP_Y);
}
