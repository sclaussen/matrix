#include <FastLED.h>


#define DATA_PIN 3
#define NUM_LEDS 256
#define BRIGHTNESS 10


CRGB leds[NUM_LEDS];


void setup() {
    FastLED.addLeds<WS2811, DATA_PIN, GRB>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
    FastLED.setBrightness(100);
    Serial.begin(9600);
}


void loop() {
    for (int i = 0; i < NUM_LEDS; i++) {
        leds[i].setRGB(random(0, 255), random(0, 255), random(0, 255));
        FastLED.show();
        delay(30);
    }
    delay(1000);
}
