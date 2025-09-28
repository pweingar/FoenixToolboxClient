import re

names = []
sys_calls = {}

for arch in ["65816", "68k"]:
	with open(f"addresses_{arch}.csv", "r") as addresses:
		for line in addresses.readlines():
			m = re.match(r'\"([a-zA-Z0-9\_]+)\",\"([0-9a-fA-F]+)\"', line)
			if m:
				name = m.group(1)
				address = m.group(2)

				names.append(name)
				sys_calls[name] = address

	with open(f"bindings_{arch}.s", "w") as bindings:
		bindings.write(";;;\n")
		bindings.write(";;; Bindings for the Foenix Toolbox public calls\n")
		bindings.write(";;;\n\n")

		for name in names:
			bindings.write("\t.public {}\n".format(name))

		bindings.write("\n")

		for name in names:
			address = sys_calls[name]
			bindings.write("{0:28} .equlab 0x{1}\n".format(name, address))
