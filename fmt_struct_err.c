#include <stdio.h>

#include "fmt_struct_err.h"

void fmt_struct_err(char* msg) {
	fprintf(stderr, "Error: %s\n", msg);
}
