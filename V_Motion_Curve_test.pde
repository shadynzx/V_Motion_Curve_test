import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import codeanticode.syphon.*;
float   m_faudioX = 0.;
float   m_faudioY = 0.;
float   outAudioX = 0.;
float eRadius;
float AudioAdj=1;
float radiun=0;

Minim minim;
SyphonServer server;
VizAudio vizAudio;
//PUSSY PUSSY PUSSY
//DELETE PUSSY PLEASE
void settings() {
  size(1024, 768, P3D);
  PJOGL.profile=1;
}
void setup() {

  minim = new Minim(this);
  vizAudio = new VizAudio(minim);
  server = new SyphonServer(this, "Processing Syphon");
  //smooth(10);
}

void draw() {
  // I DONT LIKE SLEEP
  //background(0);
  fill (0, 75);
  noStroke();
  rect (0, 0, width, height);
  vizAudio.draw();

  greenLine();
  server.sendScreen();
}

void greenLine() {
  //pushMatrix();
  //translate(width/2, height/2, 0);
  //stroke(0, 255, 0);
  //fill(0);
  ////ellipse(0, 0, 600, 600);

  //popMatrix();

  translate(width/2, height/2);
  noFill();
  stroke( 255);
  line(-300, 0, -371, -40);
  line(-300, 0, -400, 0);
  line(0, -325, -63, -344);
  line(45, -323, -37, -348);
  line(94, -312, 0, -350);
  line(-235, -233, -128, -271);
  line(300, 0, 376, 0);
  arc(0, 0, 600, 600, PI, TWO_PI);
  arc(0, 0, 650, 650, PI+QUARTER_PI+QUARTER_PI, TWO_PI);
  arc(0, 0, 700, 700, PI, PI+QUARTER_PI+QUARTER_PI);

  strokeWeight(13);
  arc(0, 0, 650, 650, PI, PI+QUARTER_PI);
  strokeWeight(30);
  stroke(255);
  arc(0, 0, 700, 700, PI+HALF_PI, TWO_PI);
  stroke(255, 255*m_faudioY/AudioAdj);
  noFill();
  ellipse(300, 0, 15, 15);
  strokeWeight(.8);
  for (int i = 0; i < 30; i+=5) {
    strokeWeight(1.7);
    arc(i, 0, 600, 600, PI, PI+QUARTER_PI*(m_faudioX/AudioAdj));
    arc(i, 0, 700, 700, PI, PI+QUARTER_PI*(m_faudioX/AudioAdj));
    arc(i, 0, 700, 700, 0, PI*(m_faudioY/AudioAdj));
    arc(i, 0, 600, 600, 0, QUARTER_PI*(m_faudioX/AudioAdj));
    strokeWeight(5);
  }
  strokeWeight(1);
  arcRotate(-300, 0, m_faudioY);
  scale(0.5);
  arcRotate(-746, -80, m_faudioX);
}

void arcRotate(float x, float y, float audAdj) {

  pushMatrix();
  translate(x, y);
  rotate(radiun);
  fill(0, 255, 0);
  noStroke();
  arc(0, 0, 38, 38, 0, PI);
  fill(0, 255, 0, 170);
  arc(0, 0, 50, 50, 0, HALF_PI);
  arc(0, 0, 60, 60, PI, PI+QUARTER_PI);

  fill(0, 255, 0, 80);
  arc(0, 0, 80, 80, PI+2*QUARTER_PI, TWO_PI);
  fill(0);
  ellipse(0, 0, 30, 30);
  strokeWeight(2);
  noFill();
  stroke(175);
  ellipse(0, 0, 90+audAdj*10, 90+audAdj*10);
  fill(255);
  ellipse(0, 0, 15, 15);
  line(0, 0, 15, 15);
  popMatrix();
  radiun += 0.05;
}