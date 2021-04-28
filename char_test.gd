#extends KinematicBody2D
#
#class_name Char_test
#
#const SPEED = 40
#var collision = Vector2()
##onready var path = []
#var rng = RandomNumberGenerator.new()
#onready var level_navigation = get_parent()
#onready var close_position = null
#
#func _ready():
#	close_position = Vector2(global_position.x +  200, global_position.y + 200)
#	var path = level_navigation.get_simple_path(global_position, close_position, true)
##
#func generate_path():
#	print(level_navigation)
#	print(global_position, close_position)
###
#func move():
#	generate_path()
#	collision = move_and_slide(collision)
#func _physics_process(delta):
#	move()
