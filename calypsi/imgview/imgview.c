#include <f256.h>
#include <stdio.h>
#include <stdint.h>
#include "../lib/include/toolbox.h"

const uint32_t palette_address = 0xf03000;
const uint32_t image_address = 0x020000;

uint8_t clut[1024];

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

	printf("Opened: %s\n", path);

	short n = 0;
	do {
		n = sys_chan_read(fd, (unsigned char *)address, 256);
		if (address > 0) {
			address += n;
		} else {
			break;
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
	uint8_t * hw_clut = (uint8_t *)palette_address;
	uint32_t start_addr = 0;

	sprintf(path, "%s.pal", base_name);
	short result = load_file(path, (uint32_t)clut); // sys_fsys_load(path, (uint32_t)hw_clut, &start_addr);
	if (result < 0) {
		printf("Could not load palette file %s: %s\n", path, sys_err_message(result));
		return result;
	}

	for (int i = 0; i < 4*256; i++) {
		hw_clut[i] = clut[i];
	}

	printf("Loaded palette.\n");

	sprintf(path, "%s.raw", base_name);
	result = load_file(path, image_address);
	if (result < 0) {
		printf("Could not load image file %s: %s\n", path, sys_err_message(result));
		return result;
	}

	printf("Loaded image data.\n");

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
	sys_txt_set_resolution(0, 640, 480);

	// Setup layers... just make them all bitmaps
	Vicky.layer0 = Layer_Bitmap0;
	Vicky.layer1 = Layer_Bitmap1;
	Vicky.layer2 = Layer_Bitmap2;

	// Set the image address
	Vicky.bitmap[0].lut = 0;
	Vicky.bitmap[0].lut = 0;
	Vicky.bitmap[0].enable = 1;
	Vicky.bitmap[0].data = (vram_ptr)image_address;

	for (uint16_t i = 0; i < (uint16_t)320 * (uint16_t)200; i++) {
		uint8_t * data = (uint8_t *)image_address;
		data[i] = 0;
	}

	do {
		display_image("/sd0/pepeshan1");
		display_image("/sd0/pepeshan2");
		display_image("/sd0/pepeshan3");
	} while (1);
}