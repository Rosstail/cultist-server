extends Node

class_name Scene_Spawner

func _ready():
	pass

func _init():
	var npc_scene = load("res://Scenes/Entities/Villager.tscn")
	var vill_dict = ServerData.village_data.villagers
	var homes = ServerData.homes
	for vill in vill_dict:
		var villager = vill_dict[vill]
		var npc = npc_scene.instance()
		npc.position.x = homes[villager.home][0]
		npc.position.y = homes[villager.home][1]
		npc.gnrt(villager)
		print("spawned " + villager.name + " at " + str(npc.position.x) + ":" + str(npc.position.y))
