
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

#include "imageIO.h"
#include "cudaCrop.h"

int main()
{
    const char* input_path = R"(C:\Users\owner\source\repos\CudaCropTest\CudaCropTest\images\sample-2000x1500.png)";
    const char* output_oath = R"(C:\Users\owner\source\repos\CudaCropTest\CudaCropTest\images\test.png)";

    uchar3 *input_image = NULL;
    int width = 0, height = 0;

    // Load image
    if (!loadImage(input_path, &input_image, &width, &height)) {
        fprintf(stderr, "loadImage failed!");
		return 1;
    }
    printf("Image loaded: %d x %d\n", width, height);

    // Save image
    if (!saveImage(output_oath, input_image, width, height)) {
		fprintf(stderr, "saveImage failed!");
        return 1;
    }

    return 0;
}
