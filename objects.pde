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
        pos = new PVector ( x0(H_TIME(time+offset) * size)  , y0(F_HEIGHT(H_TIME(time+offset)) * size )   );
    }

}

public class slider
{

    int temp_size = 10;
    PVector pos;
    PVector temp_pos;
    boolean is_selected = false;
    float value;
    String label;
    float local_size = width;
    float range;

    void check_press()
    {
        if (    (mouseX > temp_pos.x-temp_size) && (mouseX < temp_pos.x+temp_size) && (mouseY > pos.y-temp_size) && (mouseY < pos.y+temp_size) && is_selected == false) 
        {
         is_selected = true;
        }
    }

    void check_release()
    {
        if (is_selected)
        {
            is_selected = false;
        }
    }

    void display()
    {
        fill(0);
        line(pos.x - local_size/2, pos.y, pos.x + local_size/2, pos.y);
        circle(temp_pos.x, pos.y, temp_size);
        text(label + ": " + value, pos.x - local_size/4, pos.y + 20);

        if (is_selected) 
        {
            if ( (mouseX > pos.x - local_size/2) && (mouseX < pos.x + local_size/2))
            {
                temp_pos.x = mouseX;
            }
        }

        if (temp_pos.x < (pos.x - local_size/2))
        {
            temp_pos.x = pos.x;
        }

        value =range*(temp_pos.x-(pos.x-(local_size/2)))/(local_size);

    }

    float get_value()
    {
        return(value);
    }

}