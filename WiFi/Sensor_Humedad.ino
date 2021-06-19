float valorA0;

void setup() {
  Serial.begin(115200);
  pinMode(A0,INPUT);
}

void loop() {
  valorA0 = analogRead(A0);
  int hum = (100 - valorA0*100/1024)*2;

  if(hum < 10){
    Serial.print("00");
    Serial.print(hum);
  }
  else if(hum >= 10 && hum < 100){
    Serial.print("0");
    Serial.print(hum);
  }
  else Serial.print("100");
  Serial.print("34567");
  delay(1000);
}
