#include <f256.h>
#include <stdio.h>
#include <stdint.h>
#include "../lib/include/toolbox.h"

volatile bitmap_t * vky_bitmap0 = (bitmap_t *)0xf01100;

const uint32_t palette_address = 0xf03000;
const uint32_t image_address = 0x020000;

/**
 * @brief Try to load a file into RAM
 * 
 * @param path the path to the file to load
 * @param address the address to start loading it to
 * @return short 0 on success, any other number is an error
 */
short load_file(const char * path, uint32_t address) {
	short fd = sys_fsys_open(path, FSYS_READ);
	if (fd < 0) {
		// Could not open file
		return fd;
	}

	short n = 0;
	do {
		n = sys_chan_read(fd, (unsigned char *)address, 2048);
		if (address > 0) {
			address += n;
		}
	} while (n > 0);

	// Close the file
	sys_fsys_close(fd);

	return 0;
}

/**
 * @brief Load a raw image and its associated color palette given the base name.
 * 
 * If the basename is something like /sd1/picture
 * then the palette file will be /sd1/picture.pal
 * and the raw image file will be /sd1/picture.raw
 * 
 * @param base_name the base path for the file
 * @return short 0 on success, any other number is an error
 */
short load_image(const char * base_name) {
	char path[80];

	sprintf(path, "%s.pal", base_name);
	short result = load_file(path, palette_address);
	if (result < 0) {
		printf("Could not load palette file: %s\n", sys_err_message(result));
		return result;
	}

	sprintf(path, "%s.raw", base_name);
	result = load_file(path, image_address);
	if (result < 0) {
		printf("Could not load image file: %s\n", sys_err_message(result));
		return result;
	}

	return 0;
}

/**
 * @brief Attempt to load and display the image file... pausing for some time after loading.
 * 
 * @param path the base path for the file
 */
void display_image(const char * path) {
	printf("\e[2J\e[HLoading: %s\n", path);

	short result = load_image(path);
	if (result < 0) {
		printf("Could not load the image: %s\n", sys_err_message(result));
		while (1) ;
	}

	uint32_t target_jiffies = sys_time_jiffies() + 30 * 60;
	while (target_jiffies > sys_time_jiffies());
}

int main(int c, char * argv[]) {
	// Turn on text, overlay, graphics, and bitmaps
	sys_txt_set_mode(0, TXT_MODE_TEXT | TXT_MODE_BITMAP);

	// Set resolution to 640x400 text / 320x200 graphics
	sys_txt_set_resolution(0, 640, 400);

	// Setup layers... just make them all bitmaps
	Vicky.layer0 = 0;
	Vicky.layer1 = 1;
	Vicky.layer2 = 2;

	// Set the image address
	vky_bitmap0->lut = 0;
	vky_bitmap0->enable = 1;
	vky_bitmap0->data = (vram_ptr)image_address;

	do {
		display_image("/sd0/pepeshan");
		display_image("/sd0/pepeshan2");
		display_image("/sd0/pepeshan3");
	} while (1);
}