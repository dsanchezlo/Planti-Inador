#include <Wire.h>
#include <BH1750.h>
#include <Rtc_Pcf8563.h>
#include <Ubidots.h>

BH1750 lightMeter;                    // Sensor de Luz BH1750FVI
Rtc_Pcf8563 rtc;                      // Reloj RTC I2C PCF8563

const char* UBIDOTS_TOKEN = "...";    // TOKEN de Ubidots
const char* WIFI_SSID = "...";        // Red WiFi
const char* WIFI_PASS = "...";        // Contraseña de la red 

int lux1;
int lux2;
int lux;
int hum;
float valorA0;
int cancionRP;
int cancionLT;
int maceta;
int Tplanta;
String tiempo;
int hora;
int minuto;
byte dato0;
byte MODluz;
byte MODbomba;
byte MODelectrov;
byte highLevel;
byte lowLevel;
byte activarB;
byte prenderB;
byte activarEV;
byte regar;
int luzON;

Ubidots ubidots(UBIDOTS_TOKEN, UBI_HTTP);

void setup() {

  Serial.begin(115200, SERIAL_7E2);
  Wire.begin(D4,D3);                  // SCL y SCA
  pinMode(A0,INPUT);                  // Pin que recibe el valor de humedad
  pinMode(D5,INPUT);                  // Pin que indica si el modúlo de luz está conectado
  
  // Sensor de Luz BH1750FVI
  lightMeter.begin();                 // Inicia el sensor
  Serial.println(F("BH1750 Test"));   // Establece la configuración en la que estará operando el sensor

  // Reloj RTC I2C PCF8563
  rtc.initClock();                    // Inicia el reloj
  rtc.setDate(26, 1, 7, 0, 21);       // Configurar día, día de la semana, mes, siglo (1 = 1900, 0 = 2000), año (0 - 99)
  rtc.setTime(15, 30, 0);             // Configurar hora, minuto, segundo
  
  ubidots.wifiConnect(WIFI_SSID, WIFI_PASS);      // Establece la conexión con la red WiFi

  lux1 = 0;
  lux2 = 0;
  lux = 0;
  hum = 0;
  cancionRP = 1;
  cancionLT = 1;
  maceta = 1;
  Tplanta = 1;
  luzON = 0;
  tiempo = '0';
  minuto = 0;
  hora = 0;
}

void loop() {

// Enviar datos a la FPGA
  
  luzON = digitalRead(D5);
  
  if(luzON == 1){
  // Para promediar dos valores de luz recibidos por el sensor de luz BH1750FVI
  lux1 = lightMeter.readLightLevel();
  delay(500);
  lux2 = lightMeter.readLightLevel();
  } else delay(500);
  
  // Se reciben datos de Ubidots
  cancionRP = ubidots.get("esp8266", "cancionrp");
  cancionLT = ubidots.get("esp8266", "cancionlt");
  maceta = ubidots.get("esp8266", "maceta");
  Tplanta = ubidots.get("esp8266", "tipo-planta");  

  // Sensor de humedad YL - 100
  valorA0 = analogRead(A0);
  hum = (100 - valorA0*100/1024)*2;
  if(hum < 10){
    Serial.print("00");
    Serial.print(hum);
  }
  else if(hum >= 10 && hum < 100){
    Serial.print("0");
    Serial.print(hum);
  }
  else if (hum >= 100) Serial.print("100");

  Serial.print(cancionRP);
  Serial.print(cancionLT);
  Serial.print(maceta);
  Serial.print(Tplanta);

  if(luzON == 1){
  // Reloj RTC I2C PCF8563
  tiempo = rtc.formatTime();
  hora = rtc.getHour();
  minuto = rtc.getMinute();
  if(hora < 10){
    Serial.print("0");
    Serial.print(hora);
  } else Serial.print(hora);
  if(minuto < 10){
    Serial.print("0");
    Serial.print(minuto);
  } else Serial.print(minuto);

  // Sensor de Luz BH1750FVI
  lux = (lux1 + lux2) / 2;
  if(lux < 10){
    Serial.print("0000");
    Serial.print(lux);
  } else if(lux < 100){
    Serial.print("000");
    Serial.print(lux);
  } else if(lux < 1000){
    Serial.print("00");
    Serial.print(lux);
  } else if(lux < 10000){
    Serial.print("0");
    Serial.print(lux);
  } else Serial.print(lux);
  } else Serial.print("000000000");
  
//////////////////////////////////////////////////////////////////////////
// Recibir datos de la FPGA

  if (Serial.available() > 0) {
    dato0 = Serial.read();
    while(dato0 != 51 && Serial.available() > 0) dato0 = Serial.read();
    if(dato0 == 51){
        MODluz = Serial.read();
        MODbomba = Serial.read();
        MODelectrov = Serial.read();
        highLevel = Serial.read();
        lowLevel = Serial.read();
        activarB = Serial.read();
        prenderB = Serial.read();
        activarEV = Serial.read();
        regar = Serial.read();
        
        if(MODluz == 48)  MODluz = 0;
        else if (MODluz == 49)  MODluz = 1;
        
        if(MODbomba == 48)  MODbomba = 0;
        else if (MODbomba == 49)  MODbomba = 1;
        
        if(MODelectrov == 48)  MODelectrov = 0;
        else if (MODelectrov == 49)  MODelectrov = 1;
        
        if(highLevel == 48)  highLevel = 0;
        else if (highLevel == 49)  highLevel = 1;
        
        if(lowLevel == 48)  lowLevel = 0;
        else if (lowLevel == 49)  lowLevel = 1;
        
        if(activarB == 48)  activarB = 0;
        else if (activarB == 49)  activarB = 1;
        
        if(prenderB == 48)  prenderB = 0;
        else if (prenderB == 49)  prenderB = 1;
        
        if(activarEV == 48)  activarEV = 0;
        else if (activarEV == 49)  activarEV = 1;
        
        if(regar == 48)  regar = 0;
        else if (regar == 49)  regar = 1;
    }
    
  }


//////////////////////////////////////////////////////////////////////////
// Enviar datos a Ubidots

  ubidots.add("humedad", hum);
  ubidots.add("modluz", MODluz);
  ubidots.add("modbomba", MODbomba);
  ubidots.add("modelectrov", MODelectrov);
  ubidots.add("highlevel", highLevel);
  ubidots.add("lowlevel", lowLevel);
  ubidots.add("activarb", activarB);
  ubidots.add("prenderb", prenderB);
  ubidots.add("activarev", activarEV);
  ubidots.add("regar", regar);
  bool bufferSent = false;
  bufferSent = ubidots.send("esp8266");
    
}
