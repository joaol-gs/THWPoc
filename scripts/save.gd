extends Node

const SAVE_PATH = "user://save.json"
const SAVE_F = "user://savestats.json"

func _save(var bestscore):
	#Pegar todos as informações a serem salvas
	var save_dict = {
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
        return '0000'# Error! We don't have a save to load.
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	save_file.close()
	#carregar as informações em variaveis
	if data['score'] == null or data['score'] == 0:
		return 0
	else:
		return data['score']
	pass
	
func _savestats(var pe, var ps, var st):
	#Pegar todos as informações a serem salvas
	var save_dict = {
			energy = pe,
			score = ps,
			spawnt = st
		}
	var save_file =  File.new()
	save_file.open(SAVE_F, File.WRITE)
	#Serializar informações do dicionario para o JSON
	save_file.store_line(to_json(save_dict))
	#Escrever no json e salvar na memoria
	save_file.close()
	pass
	
func _getRetom():
#	var score
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
        return '0000'# Error! We don't have a save to load.
	save_file.open(SAVE_F, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	save_file.close()
	#carregar as informações em variaveis
	return data
	pass
	
func _verify():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_F):
		return false
	else:
		return true