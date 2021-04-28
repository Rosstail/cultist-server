extends Node

class_name Village

var villagers = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass
#	var village_data_file = File.new()
#	village_data_file.open("res://Data/villagers.json", File.READ)
#	var village_data_json = JSON.parse(village_data_file.get_as_text())
#	village_data_file.close()
#	var village_data = village_data_json.result
#	var json_villagers = village_data["villagers"][0]
#	var id = 0
#	for villager in json_villagers:
#		villagers.append(Villager.new(id, json_villagers[villager]))
#		id = id + 1
#	print(str(villagers.size()) + " villagers generated from json")
