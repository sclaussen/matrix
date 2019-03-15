#include <FastLED.h>


#define DATA_PIN 3
#define NUM_LEDS 32


CRGB leds[NUM_LEDS];


void setup() {
    FastLED.addLeds<WS2811, DATA_PIN, GRB>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
    FastLED.setBrightness(100);
}


void loop() {
    for (int i = 0; i < NUM_LEDS; i++) {

        // Generate a random color
        int red = random(0, 255);
        int green = random(0, 255);
        int blue = random(0, 255);

        // Set the LED[i] to the random color
        leds[i].setRGB(red, green, blue);
        FastLED.show();

        // Turn the LED[i] back off
        leds[i].setRGB(0, 0, 0);
        delay(10);
    }
}
