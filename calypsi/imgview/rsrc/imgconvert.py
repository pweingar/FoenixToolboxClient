#
# Convert an image for the C256
#

from PIL import Image
from optparse import OptionParser

parser = OptionParser()
parser.add_option("-i", "--input", dest="input", help="Source image file")
parser.add_option("-p", "--pixmap", dest="pixmap", default="src/rsrc/pixmap.s", help="Destination for pixel data.")
parser.add_option("-c", "--color-table", dest="color_table", default="src/rsrc/colors.s", help="Destination for color data.")

(options, args) = parser.parse_args()

if options.input:
    with Image.open(options.input) as im:
        with open(options.color_table, "wb") as palette_file:
            palette = im.getpalette()
            while palette:
                r = palette.pop(0)
                g = palette.pop(0)
                b = palette.pop(0)
                byte_array = [b, g, r, 0]
                some_bytes = bytearray(byte_array)
                palette_file.write(some_bytes)

        with open(options.pixmap, "wb") as image_file:
            (w, h) = im.size
            for v in range(0, h):
                for u in range(0, w):
                    pixel = im.getpixel((u, v))
                    some_bytes = bytearray()
                    some_bytes.append(pixel)
                    image_file.write(some_bytes)

else:
    parser.print_help()
