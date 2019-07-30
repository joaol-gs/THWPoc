extends Node

const SAVE_PATH = "res://save.json"

func _save(var bestscore):
	#Pegar todos as informações a serem salvas
	var save_dict = {
			nome = "player11",
			score = bestscore
		}
	var save_file =  File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	#Serializar informações do dicionario para o JSON
	save_file.store_line(to_json(save_dict))
	#Escrever no json e salvar na memoria
	save_file.close()
	pass

func _load():
	#tentar ler o arquivo
	var score
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
        return # Error! We don't have a save to load.
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	save_file.close()
	#carregar as informações em variaveis
	print(data['score'])
	pass
	
	
	
	
#	while not save_file.eof_reached():
#		var current_line = parse_json(save_file.get_line())
#		# Firstly, we need to create the object and add it to the tree and set its position.
#		print(current_line["score"])
#	save_file.close()