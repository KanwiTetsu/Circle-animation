float time = 0;
float size = 300;
float size_factor = 1;
float CONST_SLIDER_X = width-(0.15*width);
int ball_count = 100;

float ball_size = 3; 

ball[] balls;
slider size_silder = new slider();
slider b_c_s = new slider();
slider balls_size = new slider();

void setup()
{
  size(1200,900, P2D);
  surface.setResizable(true);
  frameRate(1000);
  balls = new ball[100];

  for (int i = 0; i < ball_count; i++) {
    balls[i] = new ball();
    balls[i].thing = color(255, 0, 0);
  }

  size_silder.pos = new PVector(CONST_SLIDER_X,50);
  size_silder.temp_pos = new PVector(CONST_SLIDER_X,50);
  size_silder.label = "size_factor";
  size_silder.range = 1.5;

  b_c_s.pos = new PVector(CONST_SLIDER_X,80);
  b_c_s.temp_pos = new PVector(CONST_SLIDER_X,80);
  b_c_s.label = "balls";
  b_c_s.range = 100;

  balls_size.pos = new PVector(CONST_SLIDER_X,110);
  balls_size.temp_pos = new PVector(CONST_SLIDER_X,110);
  balls_size.label = "ball size";
  balls_size.range = 10;

}

void draw()
{

  for (int i = 0; i < ball_count; i++) {
    balls[i].angle = (PI/2)+(-(PI/ball_count)*i);
    balls[i].offset = (PI/ball_count)*i;
  }

  size_factor = size_silder.get_value();
  ball_count = int(b_c_s.get_value());
  ball_size = int(ceil(balls_size.get_value()));

  if (width > height)
   {
    size = (height*size_factor)/3;
   }
  else if (height <= width) 
   {
     size = (width*size_factor)/3;
   } 



  for (int i = 0; i < ball_count; i++) {
    balls[i].display();
  }
  background(255);
  time += 1/frameRate;
  fill(255);
  stroke(117);
  ellipse( x0(0) , y0(0) , 2*size, 2*size);

  //Axis
  for (int i = 0; i < ball_count; i++) {
    balls[i].axis();
  }
  

  fill(0);
  stroke(0);
  

  for (int i = 0; i < ball_count; i++) {
    fill(balls[i].thing);
    circle(balls[i].pos.x, balls[i].pos.y, size*ball_size/(20));
  }

  size_silder.display();
  b_c_s.display();
  balls_size.display();

  fill(0);
  circle( x0(cos(time)*size), y0(sin(time)*size)  ,size*ball_size/(20));
  text("fps: " + frameRate, 10, 10);
  text("time: " + time, 10, 20);
  text("size: " + size, 10, 30);

 //--- logs:

 println( balls_size.range - balls_size.get_value() );

}

float x0(float TEMP_X)
{
  return((width/2) + TEMP_X);
}

float y0(float TEMP_Y)
{
  return((height/2) + TEMP_Y);
}

void mousePressed()
{
  size_silder.check_press();
  b_c_s.check_press();
  balls_size.check_press();
}

void mouseReleased() 
{
  size_silder.check_release();
  b_c_s.check_release();
  balls_size.check_release();
}