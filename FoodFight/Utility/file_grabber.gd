extends Node

func get_files(folder):
	var gathered_files = {}
	var file_count = 0
	var dir = Directory.new()
	
	dir.open(folder)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			gathered_files[file_count] = folder + file
			file_count += 1

	return gathered_files
