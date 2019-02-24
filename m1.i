#include <avr/pgmspace.h>  // Needed to store stuff in Flash using PROGMEM
#include <FastLED.h>


#define DATA_PIN 3
#define NUM_LEDS 256
#define DELAY 25
#define BRIGHTNESS 10


CRGB leds[NUM_LEDS];


// Create the array of retro arcade characters and store it in Flash memory
const long DigDug01[] PROGMEM = {
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000,
                                 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0xff0000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0xff0000, 0xff0000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x0066cc, 0x0066cc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0xff0000, 0xff0000, 0xff0000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0x000000,
                                 0x000000, 0x000000, 0xff0000, 0xff0000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0xff0000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
};

const long DigDug02[] PROGMEM = {
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000,
                                 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x0066cc, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0xff0000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0xff0000, 0xff0000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x0066cc, 0x0066cc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0xff0000, 0xff0000, 0xff0000, 0x0066cc, 0x0066cc, 0x0066cc, 0x0066cc, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0x000000,
                                 0x000000, 0x000000, 0xff0000, 0xff0000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0x0066cc, 0x0066cc, 0x0066cc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
};

const long Qbert01[] PROGMEM = {
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000,
                                0x000000, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xffffcc, 0xffffcc, 0xff0033, 0xffffcc, 0xffffcc, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0xff0033, 0xff6600, 0xff6600, 0xff0033, 0xff0033,
                                0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033,
                                0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000,
                                0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff0033,
                                0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xff0033, 0x000000, 0xff0033, 0xff0033, 0x000033, 0x000033, 0xff6600, 0x000000,
                                0x000000, 0xff0033, 0x000033, 0x000033, 0xff0033, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000, 0xff0033, 0xff6600, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff0033, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0x000000, 0x000000, 0x000000
};

const long Qbert02[] PROGMEM = {
                                0x000000, 0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000,
                                0x000000, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xffffff, 0xffffff, 0xff0033, 0xffffff, 0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0xff0033, 0xff6600, 0xff6600, 0xff0033, 0x000000,
                                0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033,
                                0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000,
                                0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff6600, 0xff0033, 0xff0033,
                                0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff6600, 0xff0033, 0xff0033, 0x000000, 0xff0033, 0xff0033, 0x000000, 0x000000, 0xff6600, 0x000000,
                                0x000000, 0xff0033, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0xff0033, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0xff0033, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000, 0xff0033, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0x000000, 0x000000, 0xff0033, 0xff6600, 0xff6600, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                0x000000, 0x000000, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff0033, 0x000000, 0x000000, 0xff6600, 0xff6600, 0xff6600, 0xff0033, 0x000000, 0x000000, 0x000000
};

const long BombJack01[] PROGMEM = {
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x0099ff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0xffffff, 0xffffff, 0x0099ff, 0xffffff, 0xffffff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0xffffff, 0x000000, 0x0099ff, 0x000000, 0xffffff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0099ff, 0xffffff, 0x000000, 0x0099ff, 0x000000, 0xffffff, 0x0099ff, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0xffffff, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0x000000, 0xff0000, 0x000000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0x0099ff, 0x0099ff, 0x0099ff, 0xffff00, 0x0099ff, 0x0099ff, 0x0099ff, 0xffffff, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0x000000,
                                   0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xffffff, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
};

const long BombJack02[] PROGMEM = {
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x0099ff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0x0099ff, 0xffffff, 0x000000, 0x0099ff, 0x000000, 0xffffff, 0x0099ff, 0x0099ff, 0x0099ff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x0099ff, 0x0099ff, 0xffffff, 0x000000, 0x0099ff, 0x000000, 0xffffff, 0x0099ff, 0x0099ff, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0099ff, 0xffffff, 0xffffff, 0xffcc99, 0xffffff, 0xffffff, 0x0099ff, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xffcc99, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xffcc99, 0xff0000, 0x000000, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xff0000, 0xffffff, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99, 0xffffff, 0xff0000, 0xff0000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xffffff, 0x000000, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0x000000, 0xff0000, 0x000000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 0x0099ff, 0x0099ff, 0x0099ff, 0xffff00, 0x0099ff, 0x0099ff, 0x0099ff, 0xffffff, 0xffffff, 0xffffff, 0x000000,
                                   0x000000, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000,
                                   0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xff0000, 0xffffff, 0xffffff, 0xffffff, 0xffffff,
                                   0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff, 0xff0000, 0xff0000, 0xffffff, 0xff0000, 0xff0000, 0xffffff, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000,
                                   0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
};


void setup() {
    FastLED.addLeds<WS2811, DATA_PIN, GRB>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
    FastLED.setBrightness(BRIGHTNESS);
    Serial.begin(9600);
    randomSeed(analogRead(0));
}


void loop() {
    int algorithm = random(0, 19);
    algorithm = 18;

    switch (algorithm) {
    case 1:
        Serial.println("Algorithm: smiley");
        smiley(1000);
        break;
    case 2:
        Serial.println("Algorithm: animation");
        animation(1000);
        break;
    case 3:
        Serial.println("Algorithm: rgbFadeInFadeOut");
        rgbFadeInFadeOut(1000);
        break;
    case 4:
        Serial.println("Algorithm: cylonBounce");
        cylonBounce(random(0, 255), random(0, 255), random(0, 255), random(3, 15), 0, 1000);
        break;
    case 5:
        Serial.println("Algorithm: newKITT");
        newKITT(random(0, 255), random(0, 255), random(0, 255), random(3, 15), 0, 1000);
        break;
    case 6:
        Serial.println("Algorithm: fadeInFadeOut");
        fadeInFadeOut(random(2, 5), random(0, 255), random(0, 255), random(0, 255), 1000);
        break;
    case 7:
        Serial.println("Algorithm: twinkleOnRandom (quick)");
        twinkleOnRandom(random(50, 100), random(1,5), 0, 1000);
        break;
    case 8:
        Serial.println("Algorithm: twinkleOnRandom");
        twinkleOnRandom(random(5, 8), random(30, 200), 0, 1000);
        break;
    case 9:
        Serial.println("Algorithm: twinkleAlwaysOnRandom");
        twinkleAlwaysOnRandom(random(800, 1000), 0, 1000);
        break;
    case 10:
        Serial.println("Algorithm: twinkleOff");
        twinkleOff(random(3, 6), random(0, 255), random(0, 255), random(0, 255), random(50, 150), 10, 1000);
        break;
    case 11:
        Serial.println("Algorithm: rainbowCycle");
        rainbowCycle(10, 1000);
        break;
    case 12:
        Serial.println("Algorithm: theaterChaseRainbow");
        theaterChaseRainbow(50, 1000);
        break;
    case 13:
        Serial.println("Algorithm: colorWipe");
        colorWipe(random(0, 255), random(0, 255), random(0, 255), 0, 1000);
        break;
    case 14:
        Serial.println("Algorithm: colorWipeRandom");
        colorWipeRandom(0, 1000);
        break;
    case 15:
        Serial.println("Algorithm: letItRain");
        letItRain(30, 1000);
        break;
    case 16:
        Serial.println("Algorithm: arrows");
        arrows(30, 1000);
        break;
    case 17:
        Serial.println("Algorithm: checkers");
        checkers(10, 250, 1000);
        break;
    case 18:
        Serial.println("Algorithm: pest");
        pest(random(800, 1000), true, 30, 1000);
        break;
    case 19:
        Serial.println("Algorithm: strobe");
        strobe(random(0, 255), random(0, 255), random(0, 255), random(7, 12), 60, 1000);
        break;
    /* case 19: */
    /*     Serial.println("Algorithm: snake"); */
    /*     pest(random(800, 1000), false, 50, 1000); */
    /*     break; */
    /* case 20: */
    /*     Serial.println("Algorithm: happyface"); */
    /*     happyFace(30, 1000); */
    /*     break; */
    }

    /* theaterChase(255, 0, 0, 20); */
    // fire(55, 120, 15);
    /* bouncingBalls(255, 0, 0, 3); */
    // int colors[3][3] = { { 255, 0,0 }, { 255, 255, 255 }, { 0, 0, 255 } };
    /* runningLights(255, 0, 0, 100); */
    // bouncingColoredBalls(3, colors);
    /* meteorRain(255, 255, 255, 10, 64, true, 30); */
}


void checkers(int number, int speedDelay, int returnDelay) {

    for (int i = 0; i < number; i++) {

        for (int y = 1; y <= 16; y++) {
            for (int x = 1; x <= 16; x++) {
                int toggle = 0;
                if (y % 2 == 0) {
                    toggle = 1;
                }
                if (x % 2 == toggle) {
                    set(getLedNumber(x, y), 255, 255, 255);
                } else {
                    set(getLedNumber(x, y), 1, 1, 1);
                }
            }
        }
        show();

        delay(speedDelay);

        for (int y = 1; y <= 16; y++) {
            for (int x = 1; x <= 16; x++) {
                int toggle = 0;
                if (y % 2 == 1) {
                    toggle = 1;
                }
                if (x % 2 == toggle) {
                    set(getLedNumber(x, y), 255, 255, 255);
                } else {
                    set(getLedNumber(x, y), 1, 1, 1);
                }
            }
        }
        show();

        delay(speedDelay);
    }

    delay(returnDelay);
}


void pest(int number, boolean pest, int speedDelay, int returnDelay) {
    int x = random(0, 17);
    int y = random(0, 17);

    for (int i = 0; i < number; i++) {
        setRandom(getLedNumber(x, y));
        show();

        boolean directionFound = false;
        while (directionFound == false) {
            int direction = random(0, 5);
            switch (direction) {

            case 1: // north
                if (y > 1) {
                    directionFound = true;
                    y--;
                }
                break;

            case 2: // south
                if (y < 16) {
                    directionFound = true;
                    y++;
                }
                break;

            case 3: // east
                if (x > 1) {
                    directionFound = true;
                    x--;
                }
                break;

            case 4: // west
                if (x < 16) {
                    directionFound = true;
                    x++;
                }
                break;
            }
        }

        delay(speedDelay);
    }

    delay(returnDelay);
}


void happyFace(int drops, int returnDelay) {
    delay(returnDelay);
}


void letItRain(int drops, int returnDelay) {

    for (int i = 0; i < drops; i++) {

        int x = random(0, 17);
        int speedDelay = random(0, 15);
        int length = random(2, 15);

        for (int y = 1; y <= 16; y++) {

            if (y > length) {
                setOff(getLedNumber(x, y - length));
            }

            set(getLedNumber(x, y), random(0, 255), random(0, 255), random(0, 255));

            show();
            delay(speedDelay);
        }

        setAllOff();
    }

    delay(returnDelay);
}


void arrows(int shots, int returnDelay) {

    for (int i = 0; i < shots; i++) {

        int y = random(3, 14);
        int speedDelay = random(0, 20);
        int length = random(9, 13);

        for (int x = 1; x <= 16; x++) {

            if (x > length) {
                setOff(getLedNumber(x - length, y));
            }

            set(getLedNumber(x, y), random(0, 255), random(0, 255), random(0, 255));

            if (x > 4) {
                setOff(getLedNumber(x - 2, y - 1));
                setOff(getLedNumber(x - 3, y - 2));
                setOff(getLedNumber(x - 2, y + 1));
                setOff(getLedNumber(x - 3, y + 2));

                set(getLedNumber(x - 1, y - 1), random(0, 255), random(0, 255), random(0, 255));
                set(getLedNumber(x - 2, y - 2), random(0, 255), random(0, 255), random(0, 255));
                set(getLedNumber(x - 1, y + 1), random(0, 255), random(0, 255), random(0, 255));
                set(getLedNumber(x - 2, y + 2), random(0, 255), random(0, 255), random(0, 255));
            }

            FastLED.show();
            delay(speedDelay);
        }
        setAllOff();
        Serial.println(' ');
    }

    delay(returnDelay);
}


void animation(int returnDelay) {
    for (int motion = 0; motion < 4; motion++) {

        // Display Qbert first frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(Qbert01[i]));  // Read array from Flash
        }
        FastLED.show();
        delay(500);


        // Display Qbert second frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(Qbert02[i]));
        }
        FastLED.show();
        delay(500);
    }


    for (int motion = 0; motion < 4; motion++) {

        // Display DigDug first frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(DigDug01[i]));
        }
        FastLED.show();
        delay(250);


        // Display DigDug second frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(DigDug02[i]));
        }
        FastLED.show();
        delay(250);
    }


    for (int motion = 0; motion < 4; motion++) {

        // Display BombJack first frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(BombJack01[i]));
        }
        FastLED.show();
        delay(400);


        // Display BombJack second frame
        FastLED.clear();
        for (int i = 0; i < NUM_LEDS; i++) {
            leds[i] = pgm_read_dword(&(BombJack02[i]));
        }
        FastLED.show();
        delay(400);
    }

    delay(returnDelay);
}


// Ramp up and then down the intensity of red, followed by green, and
// then blue.
void rgbFadeInFadeOut(int returnDelay) {
    fadeInFadeOut(1, 255, 0, 0, 0);
    fadeInFadeOut(1, 0, 255, 0, 0);
    fadeInFadeOut(1, 0, 0, 255, 0);

    delay(returnDelay);
}


// Ramp up and then down the intensity of the color passed in.
void fadeInFadeOut(int number, int red, int green, int blue, int returnDelay) {
    float r, g, b;

    for (int i = 0; i < number; i++) {
        for (int k = 0; k < 256; k = k + 4) {
            r = (k / 256.0) * red;
            g = (k / 256.0) * green;
            b = (k / 256.0) * blue;
            setAll(r, g, b);
            show();
        }

        for (int k = 255; k >= 0; k = k - 4) {
            r = (k / 256.0) * red;
            g = (k / 256.0) * green;
            b = (k / 256.0) * blue;
            setAll(r, g, b);
            show();
        }
    }

    delay(returnDelay);
}


// Flash the LEDs using the passed in color.
//
// Paramters:
// - (color): red, green, blue: color to flash
// - flashDelay: ms delay between flashes
// - returnDelay: ms delay after all flashes
void strobe(int red, int green, int blue, int numberOfFlashes, int speedDelay, int returnDelay) {

    for (int flash = 0; flash < numberOfFlashes; flash++) {

        /* setAll(red, green, blue); */
        setAllRandom();
        show();

        delay(speedDelay);
        setAllOff();

        show();
        delay(speedDelay);
    }

    delay(returnDelay);
}


// A cylon is a sequence of lights the color of the RGB passed to the
// function.  The first and last light in the sequence has an
// intensity of 1/10th the lights in the sequence.  The cylon moves
// from the first LED on the strip to the last LED on the strip and
// then moves from the last LED on the strip back to the first one.
void cylonBounce(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {

    for (int ledNumber = 0; ledNumber < NUM_LEDS - cylonLength - 2; ledNumber++) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        delay(speedDelay);
    }

    delay(speedDelay);

    for (int ledNumber = NUM_LEDS - cylonLength - 2; ledNumber > 0; ledNumber--) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        delay(speedDelay);
    }

    delay(returnDelay);
}


void newKITT(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {
    /* rightToLeft(red, green, blue, cylonLength, speedDelay, returnDelay); */
    /* leftToRight(red, green, blue, cylonLength, speedDelay, returnDelay); */
    outsideToCenter(red, green, blue, cylonLength, speedDelay, returnDelay);
    centerToOutside(red, green, blue, cylonLength, speedDelay, returnDelay);
    /* leftToRight(red, green, blue, cylonLength, speedDelay, returnDelay); */
    /* rightToLeft(red, green, blue, cylonLength, speedDelay, returnDelay); */
    /* outsideToCenter(red, green, blue, cylonLength, speedDelay, returnDelay); */
    /* centerToOutside(red, green, blue, cylonLength, speedDelay, returnDelay); */

    delay(returnDelay);
}


void centerToOutside(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {
    for (int ledNumber = ((NUM_LEDS - cylonLength) / 2); ledNumber >= 0; ledNumber--) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        cylon(NUM_LEDS - ledNumber - cylonLength - 1, red, green, blue, cylonLength);
        delay(speedDelay);
    }
}


void outsideToCenter(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {
    for (int ledNumber = 0; ledNumber <= ((NUM_LEDS - cylonLength) / 2); ledNumber++) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        cylon(NUM_LEDS - ledNumber - cylonLength - 1, red, green, blue, cylonLength);
        delay(speedDelay);
    }
}


void leftToRight(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {
    for (int ledNumber = 0; ledNumber < NUM_LEDS - cylonLength - 2; ledNumber++) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        delay(speedDelay);
    }
}


void rightToLeft(int red, int green, int blue, int cylonLength, int speedDelay, int returnDelay) {
    for (int ledNumber = NUM_LEDS - cylonLength - 2; ledNumber > 0; ledNumber--) {
        setAllOff();
        cylon(ledNumber, red, green, blue, cylonLength);
        delay(speedDelay);
    }
}


void cylon(int ledNumber, int red, int green, int blue, int cylonLength) {
    dim(ledNumber, red, green, blue);
    for (int offset = 1; offset <= cylonLength; offset++) {
        /* set(ledNumber + offset, red, green, blue); */
        set(ledNumber + offset, red, green, blue);
    }
    dim(ledNumber + cylonLength + 1, red, green, blue);
    show();
}


void twinkleOn(int number, int red, int green, int blue, int count, int speedDelay, int returnDelay) {
    setAllOff();

    for (int i = 0; i < number; i++) {
        int ledNumber[NUM_LEDS];

        for (int j = 0; j < count; j++) {
            ledNumber[j] = random(NUM_LEDS);
            set(ledNumber[j], red, green, blue);
            show();
        }

        delay(speedDelay);

        for (int k = 0; k < count; k++) {
            setOff(ledNumber[k]);
            show();
        }
    }

    delay(returnDelay);
}


void twinkleOnRandom(int number, int count, int speedDelay, int returnDelay) {
    setAllOff();

    int ledNumber[NUM_LEDS];

    for (int i = 0; i < number; i++) {
        for (int j = 0; j < count; j++) {
            ledNumber[j] = random(NUM_LEDS);
            set(ledNumber[j], random(0, 255), random(0, 255), random(0, 255));
            show();
        }

        delay(speedDelay);

        for (int k = 0; k < count; k++) {
            setOff(ledNumber[k]);
            show();
        }
    }

    delay(returnDelay);
}


void twinkleAlwaysOnRandom(int number, int speedDelay, int returnDelay) {
    setAllOff();
    setAllRandom();

    for (int i = 0; i < number; i++) {
        int ledNumber = random(NUM_LEDS);
        set(ledNumber, random(0, 255), random(0, 255), random(0, 255));
        show();
        delay(speedDelay);
    }

    delay(returnDelay);
}


void twinkleOff(int number, int red, int blue, int green, int count, int speedDelay, int returnDelay) {

    for (int i = 0; i < number; i++) {
        setAll(red, blue, green);

        int ledNumber[NUM_LEDS];
        for (int j = 0; j < count; j++) {
            ledNumber[j] = random(NUM_LEDS);
            int dimOrOff = random(1, 3);
            if (dimOrOff == 1) {
                dim(ledNumber[j], red, green, blue);
            } else {
                setOff(ledNumber[j]);
            }
            show();
        }

        delay(speedDelay);

        for (int j = 0; j < count; j++) {
            /* set(ledNumber[j], red, blue, green); */
            set(ledNumber[j], random(0, 255), random(0, 255), random(0, 255));
            show();
        }

    }
    delay(returnDelay);
}


void runningLights(int red, int green, int blue, int speedDelay) {

    int position = 0;
    for (int j = 0; j < NUM_LEDS * 2; j++) {

        position++; // = 0; //position + Rate;

        for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber++) {
            // sine wave, 3 setAllOffset waves make a rainbow!
            // float level = sin(i+position) * 127 + 128;
            // set(i,level,0,0);
            // float level = sin(i+position) * 127 + 128;
            set(ledNumber,
                ((sin(ledNumber + position) * 127 + 128) / 255) * red,
                ((sin(ledNumber + position) * 127 + 128) / 255) * green,
                ((sin(ledNumber + position) * 127 + 128) / 255) * blue);
        }

        show();
        delay(speedDelay);
    }
}


void colorWipe(int red, int green, int blue, int speedDelay, int returnDelay) {
    for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber++) {
        set(ledNumber, red, green, blue);
        show();
        delay(speedDelay);
    }

    delay(returnDelay);
}


void colorWipeRandom(int speedDelay, int returnDelay) {
    for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber++) {
        set(ledNumber, random(0, 255), random(0, 255), random(0, 255));
        show();
        delay(speedDelay);
    }

    delay(returnDelay);
}


void rainbowCycle(int speedDelay, int returnDelay) {
    setAllOff();

    int* c;
    int i;
    int j;

    for (j = 0; j < 256 * 5; j++) { // 5 cycles of all colors on wheel

        for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber++) {
            c = wheel(((ledNumber * 256 / NUM_LEDS) + j) & 255);
            set(ledNumber, *c, *(c + 1), *(c + 2));
        }

        show();
        delay(speedDelay);
    }

    delay(returnDelay);
}


int* wheel(int wheelPosition) {
    static int c[3];

    if (wheelPosition < 85) {
        c[0] = wheelPosition * 3;
        c[1] = 255 - wheelPosition * 3;
        c[2] = 0;
    } else if (wheelPosition < 170) {
        wheelPosition -= 85;
        c[0] = 255 - wheelPosition * 3;
        c[1] = 0;
        c[2] = wheelPosition * 3;
    } else {
        wheelPosition -= 170;
        c[0] = 0;
        c[1] = wheelPosition * 3;
        c[2] = 255 - wheelPosition * 3;
    }

    return c;
}


void theaterChase(int red, int green, int blue, int speedDelay) {
    for (int j = 0; j < 5; j++) {  //do 10 cycles of chasing
        for (int q = 0; q < 3; q++) {
            /* for (int q = 0; q < 2; q++) { */
            for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber = ledNumber + 3) {
                set(ledNumber + q, red, green, blue);    //turn every third pixel on
            }
            show();

            delay(speedDelay);

            for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber = ledNumber + 3) {
                setOff(ledNumber + q);        // turn every third pixel setAllOff
            }
        }
    }
}


void theaterChaseRainbow(int speedDelay, int returnDelay) {
    int *c;

    for (int j = 0; j < 256; j++) {     // cycle all 256 colors in the wheel */
        /* for (int j = 0; j < 256; j += 3) {     // cycle all 256 colors in the wheel */
        for (int q = 0; q < 3; q++) {

            for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber = ledNumber + 3) {
                c = wheel((ledNumber + j) % 255);
                set(ledNumber + q, *c, *(c + 1), *(c + 2));    //turn every third pixel on
            }
            show();

            delay(speedDelay);

            for (int ledNumber = 0; ledNumber < NUM_LEDS; ledNumber = ledNumber + 3) {
                setOff(ledNumber + q);        // turn every third pixel setAllOff
            }
        }
    }

    delay(returnDelay);
}


// - cooling: indicates how fast a flame cools down. More cooling
//   means shorter flames, and the recommended values are between 20
//   and 100. 50 seems the nicest.
// - sparking: indicates the chance (out of 255) that a spark will
//   ignite. A higher value makes the fire more active. Suggested
//   values lay between 50 and 200, with my personal preference being
//   120.
void fire(int cooling, int sparking, int speedDelay) {
    static int heat[NUM_LEDS];
    int coolDown;

    // Step 1. Cool down every cell a little
    for (int i = 0; i < NUM_LEDS; i++) {
        coolDown = random(0, ((cooling * 10) / NUM_LEDS) + 2);
        if (coolDown > heat[i]) {
            heat[i] = 0;
        } else {
            heat[i] = heat[i] - coolDown;
        }
    }

    // Step 2. Heat from each cell drifts 'up' and diffuses a little
    for (int k = NUM_LEDS - 1; k >= 2; k--) {
        heat[k] = (heat[k - 1] + heat[k - 2] + heat[k - 2]) / 3;
    }

    // Step 3. Randomly ignite new 'sparks' near the bottom
    if (random(0, 255) < sparking) {
        int y = random(7);
        heat[y] = heat[y] + random(160,255);
    }

    // Step 4.  Convert heat to LED colors
    for (int j = 0; j < NUM_LEDS; j++) {
        setHeatColor(j, heat[j]);
    }

    show();
    delay(speedDelay);
}


void setHeatColor(int ledNumber, int temperature) {
    // Scale 'heat' down from 0-255 to 0-191
    int t192 = round((temperature / 255.0) * 191);

    // calculate ramp up from
    int heatramp = t192 & 0x3F; // 0..63
    heatramp <<= 2; // scale up to 0..252

    // figure out which third of the spectrum we're in:
    if (t192 > 0x80) {                     // hottest
        set(ledNumber, 255, 255, heatramp);
    } else if (t192 > 0x40) {             // middle
        set(ledNumber, 255, heatramp, 0);
    } else {                               // coolest
        set(ledNumber, heatramp, 0, 0);
    }
}


void bouncingBalls(int red, int green, int blue, int ballCount) {
    float gravity = -9.81;
    int startHeight = 1;

    float height[ballCount];
    float impactVelocityStart = sqrt(-2 * gravity * startHeight);
    float impactVelocity[ballCount];
    float timeSinceLastBounce[ballCount];
    int position[ballCount];
    long clocktimeSinceLastBounce[ballCount];
    float dampening[ballCount];

    for (int i = 0 ; i < ballCount ; i++) {
        clocktimeSinceLastBounce[i] = millis();
        height[i] = startHeight;
        position[i] = 0;
        impactVelocity[i] = impactVelocityStart;
        timeSinceLastBounce[i] = 0;
        dampening[i] = 0.90 - float(i) / pow(ballCount, 2);
    }

    while (true) {
        for (int i = 0 ; i < ballCount ; i++) {
            timeSinceLastBounce[i] =  millis() - clocktimeSinceLastBounce[i];
            height[i] = 0.5 * gravity * pow(timeSinceLastBounce[i] / 1000, 2.0) + impactVelocity[i] * timeSinceLastBounce[i] / 1000;

            if (height[i] < 0) {
                height[i] = 0;
                impactVelocity[i] = dampening[i] * impactVelocity[i];
                clocktimeSinceLastBounce[i] = millis();

                if (impactVelocity[i] < 0.01) {
                    impactVelocity[i] = impactVelocityStart;
                }
            }

            position[i] = round(height[i] * (NUM_LEDS - 1) / startHeight);
        }

        for (int i = 0; i < ballCount; i++) {
            set(position[i], red, green, blue);
        }

        show();
        setAllOff();
    }
}


void bouncingColoredBalls(int ballCount, int colors[][3]) {
    float gravity = -9.81;
    int startHeight = 1;

    float height[ballCount];
    float impactVelocityStart = sqrt(-2 * gravity * startHeight);
    float impactVelocity[ballCount];
    float timeSinceLastBounce[ballCount];
    int position[ballCount];
    long clocktimeSinceLastBounce[ballCount];
    float dampening[ballCount];

    for (int i = 0 ; i < ballCount ; i++) {
        clocktimeSinceLastBounce[i] = millis();
        height[i] = startHeight;
        position[i] = 0;
        impactVelocity[i] = impactVelocityStart;
        timeSinceLastBounce[i] = 0;
        dampening[i] = 0.90 - float(i)/pow(ballCount,2);
    }

    while (true) {
        for (int i = 0 ; i < ballCount ; i++) {
            timeSinceLastBounce[i] = millis() - clocktimeSinceLastBounce[i];
            height[i] = 0.5 * gravity * pow(timeSinceLastBounce[i] / 1000 , 2.0) + impactVelocity[i] * timeSinceLastBounce[i] / 1000;

            if (height[i] < 0) {
                height[i] = 0;
                impactVelocity[i] = dampening[i] * impactVelocity[i];
                clocktimeSinceLastBounce[i] = millis();

                if (impactVelocity[i] < 0.01) {
                    impactVelocity[i] = impactVelocityStart;
                }
            }

            position[i] = round(height[i] * (NUM_LEDS - 1) / startHeight);
        }

        for (int i = 0 ; i < ballCount ; i++) {
            set(position[i], colors[i][0], colors[i][1], colors[i][2]);
        }

        show();
        setAllOff();
    }
}


void meteorRain(int red, int green, int blue, int meteorSize, int meteorTrailDecay, boolean meteorRandomDecay, int speedDelay) {
    setAllOff();

    for (int i = 0; i < NUM_LEDS + NUM_LEDS; i++) {

        // fade brightness all LEDs one step
        for (int j = 0; j < NUM_LEDS; j++) {
            if ((!meteorRandomDecay) || (random(10) > 5)) {
                fadeToBlack(j, meteorTrailDecay);
            }
        }

        // draw meteor
        for (int j = 0; j < meteorSize; j++) {
            if ((i - j < NUM_LEDS) && (i - j >= 0)) {
                set(i - j, red, green, blue);
            }
        }

        show();
        delay(speedDelay);
    }

}


void fadeToBlack(int ledNumber, int fadeValue) {
    leds[ledNumber].fadeToBlackBy(fadeValue);
}


//=============================================================================
// UTILITIES
//=============================================================================


// The ledNumbers run like this (snaked beginning in the upper right
// of the display):
//
// 015 014 013 012 011 010 009 008 007 006 005 004 003 002 001 000
// 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031
// 047 046 045 044 043 042 041 040 039 038 037 036 035 034 033 032
// ...
// 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
//
// The rows and columns work like this:
//
//    01 02 ... 16
// 01
// 02
//  .
//  .
// 16
//
int getLedNumber(int x, int y) {
    // If we are on the first, 3rd, 5th, ... line, ...
    if (y % 2 == 1) {
        x = 17 - x;
    }

    int ledNumber = ((y - 1) * 16) + (x - 1);
    return ledNumber;
}


void setAll(int red, int green, int blue) {
    for (int led = 0; led < NUM_LEDS; led++) {
        set(led, red, green, blue);
    }
    show();
}


void setAllRandom() {
    for (int led = 0; led < NUM_LEDS; led++) {
        setRandom(led);
    }
    show();
}


void setAllOff() {
    setAll(0, 0, 0);
}


void set(int ledNumber, int red, int green, int blue) {
    leds[ledNumber].setRGB(red, green, blue);
}


void setRandom(int ledNumber) {
    leds[ledNumber].setRGB(random(0, 255), random(0, 255), random(0, 255));
}


void dim(int ledNumber, int red, int green, int blue) {
    leds[ledNumber].setRGB(red / 20, green / 20, blue / 20);
}


void setOff(int ledNumber) {
    leds[ledNumber].setRGB(0, 0, 0);
}


void show() {
    FastLED.show();
}
