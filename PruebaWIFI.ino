#include <SoftwareSerial.h>

SoftwareSerial UARTcom(03, 01); //RX 03 ; TX 01

String num = "1";

void setup(){
  Serial.begin(115200);
  UARTcom.begin(4000);
}

void loop(){
  UARTcom.print("1");
  delay(500);
}

//LED cito
/*
#define LED 14
void setup(){
  pinMode (LED, OUTPUT);
  digitalWrite (LED, HIGH);
}

void loop(){
  digitalWrite(LED, LOW);
  delay(1000);
  digitalWrite(LED, HIGH);
  delay(1000);
}*/



//UBIDOTS
/*#include "UbidotsMicroESP8266.h"

#define TOKEN "BBFF-8ypuSdAqQo6I4QPIqWYBpAfjQOMtGz"
#define WIFISSID "F.Sanchez 2.4"
#define PASSWORD "LlliIIo0\\,AZx017"

Ubidots client(TOKEN);

const byte Led = D5; 

void setup() {
  pinMode(Led, OUTPUT);
  digitalWrite(Led, LOW);
  Serial.begin(115200);
  client.wifiConnection(WIFISSID, PASSWORD);
}

void loop() {
  float value1 = analogRead(A0);
  float Valor_Led = client.getValueWithDevice("esp8266", "switch");
    if (Valor_Led != ERROR_VALUE){
      Serial.print(F("Valor tomado por el Led: "));
      Serial.println(Valor_Led);
    }else{
      Serial.println(ERROR_VALUE);
      Serial.println(F("Error getting value"));
    }

  if (Valor_Led==1){
    digitalWrite(Led, HIGH);
  } else {
    digitalWrite(Led, LOW);
  }
  
  //client.add("temperature", value1);
  //client.sendAll(true);
  delay(1000);
}*/
