/*
	TODO:à tester
	Code de base pour faire fonctionner un capteur ultrason de type
	SRF04 et SRF05 :
	- Connexion des pins Trigger et Echo directement sur l'arduino
*/

// Defition des pins entrees et sorties
#define Echo 2
#define Trigger 3

// Transforme la donnée récupérée par les SRF04/05
#define timeToCm(time) ((time) / 29 / 2)
#define timeToMm(time) (((time)*10) / 29 / 2)

int time = 0;

void setup()
{
	// Debut de la communication
	Serial.begin(9600);

	// Definition des I/O
	pinMode(Echo, INPUT);
	pinMode(Trigger, OUTPUT);
}

void loop()
{
	// D'après la datasheet :
	digitalWrite(Trigger,LOW);
  delayMicroseconds(2);
  digitalWrite(Trigger,HIGH);
  delayMicroseconds(10);
  digitalWrite(Trigger,LOW);
  
  // Récupération de la longueur + insertion dans le tab
  time = pulseIn(Echo_1, HIGH);
	Serial.print("Valeur en cm : ");
	Serial.print(timeToCm(time));
	Serial.println();
}	
