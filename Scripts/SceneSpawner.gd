extends Node2D

class_name Scene_Spawner

var npc_scene
var vill_dict
var homes
var array_villagers = []

func _ready():
	pass

func _init():
	npc_scene = load("res://Scenes/Entities/Villager.tscn")
	vill_dict = ServerData.village_data.villagers
	homes = ServerData.homes
	for vill in vill_dict:
		var villager = vill_dict[vill]
		var npc = npc_scene.instance()
		npc.position.x = homes[villager.home][0]
		npc.position.y = homes[villager.home][1]
#		npc.gnrt(villager)
		array_villagers.append(npc)
		print("spawned " + villager.name + " at " + str(npc.position.x) + ":" + str(npc.position.y))
