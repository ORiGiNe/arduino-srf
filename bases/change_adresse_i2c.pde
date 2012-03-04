#include <Wire.h>
#include <Sonar_srf08.h>

/*
	TODO:tests
	Ce code sert à modifier l'adresse d'un capteur ultrason communiquant via I2C.
	Il faut IMPÉRATIVEMENT brancher un seul capteur sur le bus I2C pour éviter d'avoir
	deux devices avec la même adresse
*/

Sonar_srf08 MySonar;

#define CommandRegister 0x00
int New_Address = 236; //  changez cette valeur pour changer l'adresse du sonar
#define ResultRegister  0x02

void setup()
{
  Wire.begin();
  Wire.beginTransmission(0);
  Wire.send(0);
  Wire.send(0xA0);
  Wire.endTransmission();
   
  Wire.beginTransmission(0);
  Wire.send(0);
  Wire.send(0xAA);
  Wire.endTransmission();
  
  Wire.beginTransmission(0);
  Wire.send(0);
  Wire.send(0xA5);
  Wire.endTransmission();
  
  Wire.beginTransmission(0);
  Wire.send(0);
  Wire.send(New_Address);
  Wire.endTransmission();
  
 Serial.begin(9600);
}

void loop()
{

}
