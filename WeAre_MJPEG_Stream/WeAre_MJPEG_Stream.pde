import ipcapture.*;

IPCapture cam;

// init cameras
Camera camHead1 = new Camera("head1", 124, 8080);
Camera camHead2 = new Camera("head2", 125, 9090);
Camera camTop   = new Camera("top", 126, 7070);

void setup() {
  size(800, 480);
  //fullScreen();

  // start camera stream
  cam = new IPCapture(this, "http://" + "192.168.1."+ camHead1.ip + ":" + camHead1.port + "/?action=stream", "", "");
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
    cam = new IPCapture(this, "http://" + "192.168.1."+ camTop.ip + ":" + camTop.port + "/?action=stream", "", "");
    cam.start();
  } else if (key == 'h') {
    println("key h pressed");
    cam.stop();
    cam = new IPCapture(this, "http://" + "192.168.1."+ camHead1.ip + ":" + camHead1.port + "/?action=stream", "", "");
    cam.start();
  }
}  
