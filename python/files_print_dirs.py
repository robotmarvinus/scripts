import os

def print_dirs(path):
	dirs = os.listdir(path)
	for dir in dirs:
		newpath = path + '/' + dir
		print (newpath)
		if os.path.isdir(newpath):
			print(dir)
			print_dirs(newpath)

def main():
	print_dirs(os.getcwd())

if __name__ == '__main__':
	print('sdf')
    #main()
