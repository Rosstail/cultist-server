extends Node

class_name Villager

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id
var npc_name
var max_health
var health
var fear_veteran
var fear_newcomer
var charisma
var sect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init(id, dict):
	self.id = id
	self.npc_name = dict["name"]
	self.health = dict["health"]
	self.max_health = health
	self.fear_veteran = dict["default_fear_veteran"]
	self.fear_newcomer = dict["default_fear_newcomer"]
	self.charisma = dict["charisma"]
	self.sect = dict["sect"]
