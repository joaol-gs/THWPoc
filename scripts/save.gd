extends Node

const SAVE_PATH = "res://save.json"

func _save(var bestscore):
	#Pegar todos as informações a serem salvas
	var save_dict = {
			score = bestscore
		}
	var save_file =  File.new()
	save_file.open("res://save.json", File.WRITE)
	#Serializar informações do dicionario para o JSON
	save_file.store_line(to_json(save_dict))
	#Escrever no json e salvar na memoria
	save_file.close()
	pass