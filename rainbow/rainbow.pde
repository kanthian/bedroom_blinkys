
//PixelPusher libs
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
DeviceRegistry registry;

//Talk to controller
class TestObserver implements Observer {
  public boolean hasStrips = false;
  public void update(Observable registry, Object updatedDevice) {
        println("Registry changed!");
        if (updatedDevice != null) {
          println("Device change: " + updatedDevice);
        }
        this.hasStrips = true;
    }
}
TestObserver testObserver;

//Sketch
void setup() {
 registry = new DeviceRegistry();
 testObserver = new TestObserver();
 registry.addObserver(testObserver);
 colorMode(RGB, 255);
}

//Pushing Pixels ======>>>>>>
void draw() 
{
  if (testObserver.hasStrips) 
    {
        registry.startPushing();
        registry.setAutoThrottle(true);
        registry.setAntiLog(true);
        List<Strip> strips = registry.getStrips();
        if (strips.size() > 0) 
        {
          for(Strip strip : strips) 
          {     
          //Rainbow           
          //Vertical  
          int x = 5;
          float r = random(0,50);
          while(x<100)
          {
          x= x+5;
          if (r > 25)
          {
          int[] row12 = {8,9,10,11,28,29,30,31,48,49};
          for(int i : row12) {strip.setPixel(color(255,0,0), i);}//Red
          int[] row34 = {6,7,12,13,26,27,32,33,46,47};
          for(int i : row34) {strip.setPixel(color(255,255,0), i);}//Yellow   
          int[] Green = {4,5,14,15,24,25,34,35,44,45};
          for(int i : Green) {strip.setPixel(color(0,255,0), i);}//Green   
          int[] row78 = {2,3,16,17,22,23,36,37,42,43};
          for(int i : row78) {strip.setPixel(color(0,0,255), i);}//Blue   
          int[] row910 = {0,1,18,19,20,21,38,39,40,41};
          for(int i : row910) {strip.setPixel(color(127,0,255), i);}//Violet   
          delay(5);  
          }
          else
          {
          int[] row12 = {8,9,10,11,28,29,30,31,48,49};
          for(int i : row12) {strip.setPixel(color(127,0,255), i);}//Violet
          int[] row34 = {6,7,12,13,26,27,32,33,46,47};
          for(int i : row34) {strip.setPixel(color(255,0,0), i);}//Red   
          int[] Green = {4,5,14,15,24,25,34,35,44,45};
          for(int i : Green) {strip.setPixel(color(255,255,0), i);}//Yellow   
          int[] row78 = {2,3,16,17,22,23,36,37,42,43};
          for(int i : row78) {strip.setPixel(color(0,255,0), i);}//Green  
          int[] row910 = {0,1,18,19,20,21,38,39,40,41};
          for(int i : row910) {strip.setPixel(color(0,0,255), i);}//Blue   
          delay(5);
          }
          //Horizontal
          //for(int j = 0; j < 10; j = j+1){strip.setPixel(color(127,0,255), j);}//Violet
          //for(int j = 10; j < 20; j = j+1){strip.setPixel(color(0,0,255), j);}//Blue
          //for(int j = 20; j < 30; j = j+1){strip.setPixel(color(0,255,0), j);}//Green
          //for(int j = 30; j < 40; j = j+1){strip.setPixel(color(255,255,0), j);}//Yellow 
          //for(int j = 40; j < 50; j = j+1){strip.setPixel(color(255,0,0), j);}//Red
          }
          }
        }
    }
}