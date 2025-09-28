import os

includes = "-I. -I./include"


for arch in ["65816", "68k"]:
	print(f"Building for: {arch}")

	cmd_cc = f"cc{arch}"
	cmd_as = f"as{arch}"
	cmd_ln = f"ln{arch}"
	cmd_ar = f"nlib"

	for data_model in ['small', 'large']:
		for code_model in ['small', 'large']:
			print(f"Building for {code_model} code and {data_model} data:")
			models = f"--data-model {data_model} --code-model {code_model}"

			binding = f"bindings_{arch}"
			build_bind = f"{cmd_as} {includes} -o {binding}.o {binding}.s {models}"

			stubs = f"stubs"
			build_stub = f"{cmd_cc} {includes} -o {stubs}.o {stubs}.c {models}"

			code_abbr = "lc" if code_model == "large" else "sc"
			data_abbr = "ld" if data_model == "large" else "sd"

			library = f"tb_{arch}_{code_abbr}_{data_abbr}.a"
			build_library = f"{cmd_ar} {library} {stubs}.o {binding}.o"

			print(build_bind)
			result = os.system(build_bind)
			if result:
				print(f"Failed: {result}")
				exit(result)

			print(build_stub)
			result = os.system(build_stub)
			if result:
				print(f"Failed: {result}")
				exit(result)

			print(build_library)
			result = os.system(build_library)
			if result:
				print(f"Failed: {result}")
				exit(result)

			print("")


