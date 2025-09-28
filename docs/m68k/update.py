
#
# Update the function call references given an address.csv file
#
# usage: python update.py <TeX file> 
#

import os
import re
import sys

sys_calls = {}

# Read in the system call addresses

with open("..//..//calypsi/lib/addresses_68k.csv", "r") as addresses:
	for line in addresses.readlines():
		m = re.match(r'\"([a-zA-Z0-9\_]+)\"\s*\,\s*\"([0-9a-fA-F]+)\"', line)
		if m:
			name = m.group(1)
			address = m.group(2)
			sys_calls[name] = address

# Read in the source file and write to a temporary file
try:
	with open(sys.argv[1], "r") as input:
		line_number = 0
		try:
			with open("temp.$$$", "w") as output:
				for line in input.readlines():
					line_number = line_number + 1
					m = re.match(r'\\subsection\*\{([0-9a-zA-Z\\\_]+) \-\- 0x[0-9a-fA-F]+\}', line)
					if m:
						escaped_name = m.group(1)
						name = escaped_name.replace(r'\_', r'_')
						address = sys_calls[name]
						output.write("\\subsection*{{{0} -- 0x{1}}}\n".format(escaped_name, address))

					else:
						output.write(line)
		except Exception as e:
			print("Could not open temporary file: {0} on line {1}".format(e, line_number))
			sys.exit(2)
except:
	print("Could not open the file.")
	if os.path.exists("temp.$$$"):
		os.remove("temp.$$$")
	sys.exit(1)

os.remove(sys.argv[1])
os.rename("temp.$$$", sys.argv[1])
