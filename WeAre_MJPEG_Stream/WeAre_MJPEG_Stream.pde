import ipcapture.*;

IPCapture cam;

// init cameras
Camera camA = new Camera("CamA", 124, 8080);
Camera camB = new Camera("CamB", 125, 9090);
Camera camC = new Camera("CamC", 126, 7070); //top

void setup() {
  size(800, 480);
  //fullScreen();

  // start camera stream
  cam = new IPCapture(this, "http://" + "192.168.1."+ camA.ip + ":" + camA.port + "/?action=stream", "", "");
  //cam = new IPCapture(this, "http://" + "192.168.1."+ camB.ip + ":" + camB.port + "/?action=stream", "", "");
  cam.start();
}


void draw() {
  // display camera image
  if (cam.isAvailable()) {
    cam.read();
    image(cam, 0, 0);
    image(cam, width/2, 0);
  }
}

class Camera {
  String name;
  int ip;
  int port;

  Camera(String name_, int ip_, int port_) {
    name = name_;
    ip = ip_;
    port = port_;
  }
}

//void keyPressed() {
//  if (key == ' ') {
//    if (cam.isAlive()) cam.stop();
//    else cam.start();
//  }
//}  

void keyReleased() {
  if (key == 't') {
    println("key t pressed");
    cam.stop();
    cam = new IPCapture(this, "http://" + "192.168.1."+ camC.ip + ":" + camC.port + "/?action=stream", "", "");
    cam.start();
  } else if (key == 'h') {
    println("key h pressed");
    cam.stop();
    cam = new IPCapture(this, "http://" + "192.168.1."+ camA.ip + ":" + camA.port + "/?action=stream", "", "");
    //cam = new IPCapture(this, "http://" + "192.168.1."+ camB.ip + ":" + camB.port + "/?action=stream", "", "");
    cam.start();
  }
a}  
