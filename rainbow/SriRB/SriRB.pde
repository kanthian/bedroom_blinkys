
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
          //Sri           
          //Vertical  
          int[] s = {5,8,9,10,14,25,29,30,34,7,12,27,33,32};
          for(int i : s) {strip.setPixel(color(255,0,0), i);}   
          int[] re = {0,1,2,3,4,15,17,21,23,24,39};
          for(int i : re) {strip.setPixel(color(0,0,255), i);}   
          int[] ie = {40,41,42,44};
          for(int i : ie) {strip.setPixel(color(0,255,0), i);}
          }
          }
        }        
}