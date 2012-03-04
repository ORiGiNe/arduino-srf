#include <Wire.h>

/*
	Gestion des capteurs ultrasons en I2C
	Ce code ne gère un seul capteur
*/

#define Address_08 0xF7

int result = 0;

void setup()
{
  Wire.begin();
  pinMode(13, OUTPUT);
  Serial.begin(9600);
  
  // Changement du gain
  Wire.beginTransmission(Address_08);
  Wire.send(1);
  Wire.send(0x00);
  Wire.endTransmission();
}

void loop()
{  
	// Pour enregistrer la valeur en cm
  Wire.beginTransmission(Address_08p);
  Wire.send(0);
  Wire.send(0x51);
  Wire.endTransmission();
  delay(70); // > 66 sinon ne marche pas d'après la datasheet
  
  // Pour lire
  Wire.beginTransmission(Address_08);
  Wire.send(2);
  Wire.endTransmission();
  
  Wire.requestFrom(Address_08, 2);

  while (Wire.available() < 2 )   {
    // wait for result
  }
  
  result = Wire.receive() * 256;
  result += Wire.receive();
  
  Serial.print("Valeur en mm: ");
  Serial.println(result);
}
