#include <stdint.h>
#include <stdio.h>

extern "C"{ //__attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    printf("Hello World\n");
    return x + y;
}
double double_multiply(double x, double y){
    printf("Hello World\n");
    return x*y;
}
}