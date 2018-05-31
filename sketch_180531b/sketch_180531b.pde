
//pushing pixel by pixel
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
void draw() {
  if (testObserver.hasStrips) {
        registry.startPushing();
        registry.setAutoThrottle(true);
        registry.setAntiLog(true);
        List<Strip> strips = registry.getStrips();
        if (strips.size() > 0) {
          for(Strip strip : strips) {     
          //Only prime numbers are LIT
          //row1
          strip.setPixel(color(1,100,5), 0);
          strip.setPixel(73, 1);
          strip.setPixel(73, 2);
          strip.setPixel(color(1,100,5), 3);
          strip.setPixel(73, 4);
          strip.setPixel(color(1,100,5), 5);  
          strip.setPixel(73, 6);
          strip.setPixel(color(1,100,5), 7);
          strip.setPixel(color(1,100,5), 8);
          strip.setPixel(color(color(1,100,5),100,5), 9);
          
          //row2
          strip.setPixel(73, 10);
          strip.setPixel(color(1,100,5), 11);
          strip.setPixel(73, 12);
          strip.setPixel(color(1,100,5), 13);
          strip.setPixel(color(1,100,5), 14);
          strip.setPixel(color(1,100,5), 15);
          strip.setPixel(73, 16);
          strip.setPixel(color(1,100,5), 17);  
          strip.setPixel(73, 18);
          strip.setPixel(color(1,100,5), 19);
          
          //row3
          strip.setPixel(color(1,100,5), 20);
          strip.setPixel(color(1,100,5), 21);
          strip.setPixel(73, 22);
          strip.setPixel(color(1,100,5), 23);
          strip.setPixel(color(1,100,5), 24);
          strip.setPixel(color(1,100,5), 25);
          strip.setPixel(color(1,100,5), 26);
          strip.setPixel(color(1,100,5), 27);
          strip.setPixel(73, 28);
          strip.setPixel(color(1,100,5), 29);
          
          //row4
          strip.setPixel(73, 30);
          strip.setPixel(color(1,100,5), 31);
          strip.setPixel(color(1,100,5), 32);
          strip.setPixel(color(1,100,5), 33);
          strip.setPixel(color(1,100,5), 34);
          strip.setPixel(color(1,100,5), 35);
          strip.setPixel(73, 36);
          strip.setPixel(color(1,100,5), 37);
          strip.setPixel(color(1,100,5), 38);
          strip.setPixel(color(1,100,5), 39);
          
          //row5
          strip.setPixel(73, 40);
          strip.setPixel(color(1,100,5), 41);
          strip.setPixel(73, 42);
          strip.setPixel(color(1,100,5), 43);
          strip.setPixel(color(1,100,5), 44);
          strip.setPixel(color(1,100,5), 45);
          strip.setPixel(73, 46);
          strip.setPixel(color(1,100,5), 47);
          strip.setPixel(color(1,100,5), 48);
          strip.setPixel(color(1,100,5), 49);
          }
        }
    }
}

//Notes
//Figure out color(255,255,65,1)