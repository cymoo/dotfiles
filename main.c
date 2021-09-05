#include <float.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "b64.h"
#include "json.h"


// char* base64_encode(const byte *data, size_t input_length, size_t *output_length);
// byte* base64_decode(const char *data, size_t input_length, size_t *output_length);

struct message {
    int id;
    char content[10];
    char bin[4];
};


char* print_env() {
    const char* msg = getenv("msg");
    printf("msg: %s\n", msg);

    size_t len = 0;
    byte *buffer = base64_decode(msg, strlen(msg), &len);

    struct message *result = (struct message*)buffer;
    printf("id: %d\n", result->id);
    printf("content: %s\n", result->content);

    char *rv = malloc(1024);
    if (rv == NULL) return NULL;
    printf("input some string: ");
    scanf("%s", rv);

    // char *rv1 = malloc(1024);

    // char *fmt = "{\"id\": %d, \"content\": \"%s\", \"foo\": \"%s\"}";

    printf("*******************\n");
    char *jp = json_pack(
        "{s: i, s: s, s: f, s: b}",
        "id", result->id,
        // "content", result->content,
        "bin", rv,
        "pi", 3.1415,
        "flag", 1
    );
    printf("%s\n", jp);
    printf("###################\n");
    return jp;


    // snprintf(rv1, 1024, "{\"id\": %d, \"content\": \"%s\", \"foo\": \"%s\"}", 1, "hello", rv);
    // return rv1;
}

void test_b64() {
    const char* hello = "hello";
    size_t len1 = 0;
    char *result = base64_encode((byte*)hello, strlen(hello), &len1);
    printf("%ld\n", len1);
    printf("%s\n", result);
}

void negative_index_test() {
    const char *hello = "hello, world";
    const char *world = hello + 7;
    char comma = world[-3];   // negative array index

    printf("%c\n", *world);
    printf("%c\n", comma);
}

int main() {
    print_env();
    // test_b64();
    return 0;
}