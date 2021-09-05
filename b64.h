#ifndef B64_H
#define B64_H

#include <stdlib.h> /* for size_t */

typedef unsigned char byte;

char* base64_encode(const byte *data, size_t input_length, size_t *output_length);
byte* base64_decode(const char *data, size_t input_length, size_t *output_length);
void base64_cleanup();

#endif