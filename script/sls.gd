extends Node
#sls(save load score) a basic saving and loading variable script
func save_scoor(n_s):#n_s is the score variable to be saved
	var save_file = File.new()
	save_file.open("user://save_scoor.aymenBm",File.WRITE)
	save_file.store_var(n_s)
	save_file.close()
	pass

func load_scoor():
	var save_file = File.new()
	if not save_file.file_exists("user://save_scoor.aymenBm"):#if file do not exist the script will return 0
		save_file.close()
		return 0
	save_file.open("user://save_scoor.aymenBm",File.READ)
	var l_scoor = 0
	l_scoor = save_file.get_var()
	save_file.close()
	return l_scoor as int

func check_score(curent_score):
	if curent_score>load_scoor():#if the givin score is more the the saved score it will be saved insted
		save_scoor(curent_score)
