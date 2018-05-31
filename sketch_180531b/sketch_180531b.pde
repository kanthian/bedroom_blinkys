
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
          //Prime numbers are Blue blooded           
          for(int j = 0; j < 50; j = j+1){strip.setPixel(color(100,35,49), j);}                                
          int[] prime = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47};
          for(int i : prime) {strip.setPixel(73, i-1);}
          }
          
        }
    }
}