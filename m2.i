#include <FastLED.h>


#define DATA_PIN 3
#define NUM_LEDS 256
#define BRIGHTNESS 10


CRGB leds[NUM_LEDS];


void setup()
{
    FastLED.addLeds<WS2811, DATA_PIN, GRB>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
    FastLED.setBrightness(100);
    Serial.begin(9600);
}


void loop()
{
    //    int ledNumber = 45;
    // int ledNumber = getLedNumberGivenXAndYCoordinates(3, 3);
    Serial.println(getLedNumberGivenXAndYCoordinates(3, 6));
    /* leds[ledNumber].setRGB(random(255), random(255), random(255)); */
    /* FastLED.show(); */
    delay(1000);

    /* int ledNumber = getLedNumberGivenXAndYCoordinates(6, 5); */
    /* Serial.println(ledNumber); */
}


//=============================================================================
// UTILITIES
//=============================================================================


void set(int x, int y, int red, int green, int  blue) {
}


int getLedNumberGivenXAndYCoordinates(int x, int y)
{
    // If we are on the first, 3rd, 5th, ... line, ...
    if (y % 2 == 1)
    {
        x = 17 - x;
    }

    int ledNumber = ((y - 1) * 16) + (x - 1);
    Serial.println(ledNumber);
    return ledNumber;
}
