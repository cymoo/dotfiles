#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MEM_BLOCK 1024

/** 从fmt和数据中构建json。
 * Example:
 * >>> json_pack(
 * ... "{s: s, s: i, s: f, s: b}",
 * ... "a", "foo", "b", 13, "c": 3.14, "d": 1
 * ... )
 * {"a": "foo", "b": 13, "c": 3.14, "d": true}
 */
char* json_pack(const char *fmt, ...) {
    int alloc_len = MEM_BLOCK;
    char *buffer = malloc(alloc_len);
    if (buffer == NULL) {
        return NULL;
    }

    va_list ap;
    va_start(ap, fmt);

    int size = 0;
    for (int idx = 0; fmt[idx] != '\0'; idx++) {
        int chr = fmt[idx];
        char *data = NULL;

        switch (chr) {
            case 's': {
                char *val = va_arg(ap, char*);
                data = val;
                break;
            }
            case 'i': {
                int val = va_arg(ap, int);
                char buf[16];
                snprintf(buf, 16, "%d", val);
                data = buf;
                break;
            }
            case 'f': {
                double val = va_arg(ap, double);
                // TODO: 对于很长的浮点数，buffer有可能溢出
                char buf[32];
                snprintf(buf, 32, "%f", val);
                data = buf;
                break;
            }
            case 'b': {
                int val = va_arg(ap, int);
                data = val == 0 ? "false": "true";
                break;
            }
            default: {
                char buf[2] = {chr, '\0'};
                data = buf;
                break;
            }
        }

        int step = strlen(data);
        if (chr == 's') step += 2;

        if (size + step >= alloc_len) {
            alloc_len = size + step + MEM_BLOCK;
            char *tmp = malloc(alloc_len);
            if (tmp == NULL) return NULL;
            memcpy(tmp, buffer, size);
            free(buffer);
            buffer = tmp;
        }

        if (chr == 's') {
            buffer[size] = '"';
            memcpy(buffer + size + 1, data, strlen(data));
            buffer[size + 1 + strlen(data)] = '"';
        } else {
            memcpy(buffer + size, data, step);
        }
        size += step;
    }

    buffer[size] = '\0';
    va_end(ap);
    return buffer;
}