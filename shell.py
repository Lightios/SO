import subprocess
import os
import pathlib

from termcolor import colored

while True:
	directory = os.popen("pwd").read().strip() + "$ "

	print(colored(directory, "cyan"), end="")
	
	command = input()

	if command == "exit":
		break

	command = command.split()

	found_char = False
	for parameter in command:
		if "*" in parameter:
			parameter = parameter.replace("*", "")
			found_char = True

			all_files = os.popen("ls " + parameter + "*").read().strip().split()
			

			for file in all_files:
				if os.fork() == 0:
					os.execvp( command[0], (command[0] + " " + file).split() )
					break

				os.wait()

			break

		if "?" in parameter:
			parameter = parameter.replace("?", "")
			found_char = True

			all_files = os.popen("ls " + parameter + "*").read().strip().split()
			

			for file in all_files:
				if len(file) == len(parameter) + 1:
					if os.fork() == 0:
						os.execvp( command[0], (command[0] + " " + file).split() )
						break

					os.wait()
			break

	if not found_char:
		try:
			if command[ -1 ] != "&":
				if os.fork() == 0:
					os.execvp( command[0], command )
					break

				os.wait()

			else:
				command.pop()

				if os.fork() == 0:
					os.execvp( command[0], command )
					break

		except FileNotFoundError:
			print("Nieznane polecenie")
