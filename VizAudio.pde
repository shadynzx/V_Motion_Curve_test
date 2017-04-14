class VizAudio {
  int avgSize=30;
  float[] faudio = new float[avgSize];

  AudioInput in;
  FFT fftLin;
  FFT fftLog;
  BeatDetect beat;


  VizAudio(Minim minim) {
    in = minim.getLineIn();
    fftLin = new FFT(in.bufferSize(), in.sampleRate());
    fftLin.linAverages(30);
    fftLog = new FFT(in.bufferSize(), in.sampleRate());
    fftLog.logAverages(22, 3);
    // a beat detection object that is FREQ_ENERGY mode that 
    // expects buffers the length of song's buffer size
    // and samples captured at songs's sample rate
    beat = new BeatDetect();
    beat.setSensitivity(300);
    eRadius = 20;
  }

  void draw() {
    int  i;
    fftLin.forward(in.mix);
    fftLog.forward(in.mix);

    beat.detect(in.mix);
 


    for (i=0; i<fftLin.avgSize(); i++) {
      faudio[i]=fftLin.getAvg(i);
    }
    m_faudioY=(faudio[0]+faudio[1])/2.;
    m_faudioX=(faudio[3]+faudio[4])/2.;

    float a = map(eRadius, 20, 80, 60, 255);
    fill(60, 255, 0, a);
    if ( beat.isOnset() ) eRadius = 80;
   
    eRadius *= 0.95;
    if ( eRadius < 20 ) eRadius = 20;
  }
  float getLevel(float level){
  return in.left.level()*level;
}

  float[] getValue(int size) {
    //println(in.bufferSize());
    int temp_value=in.bufferSize()/size;
    float[] temp_float=new float[size];
    
      for(int i = 0; i <temp_float.length; i++)
  {
    temp_float[i] =in.left.get(temp_value*i);
  }
  println(temp_float[size-10]);
    return temp_float;
  }
}