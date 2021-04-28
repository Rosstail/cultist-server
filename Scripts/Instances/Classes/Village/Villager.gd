extends KinematicBody2D

class_name Villager

const SPEED = 40
var collision = Vector2()
var path = []
var rng = RandomNumberGenerator.new()
onready var level_navigation = get_parent()
onready var close_position = null
onready var screen_size = get_viewport().size
onready var animated_sprite = $AnimatedSprite
#onready var timer = $Timer
onready var in_discussion = false
var a = null
var b = null
enum {
	IDLE,
	WALK,
	DISCUSSING
}
var state = WALK
var chance = null
var fear = 0

var id
var home
var npc_name
var max_health
var health
var fear_veteran
var fear_newcomer
var charisma
var sect


func _ready():
	rng.randomize()
	close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))
#	GameManager.team.append(self)

func gnrt(id, dict):
	self.id = id
	self.home = ServerData.homes[dict["home"]]
	#global_position.x = home[0]
	#global_position.y = home[1]
	self.npc_name = dict["name"]
	self.health = dict["health"]
	self.max_health = self.health
	self.fear_veteran = dict["default_fear_veteran"]
	self.fear_newcomer = dict["default_fear_newcomer"]
	self.charisma = dict["charisma"]
	self.sect = dict["sect"]
	print(self.npc_name + " : " + self.sect)
	#print("Global position of " + self.npc_name + " : " + str(global_position))

func generate_path():
	path = level_navigation.get_simple_path(global_position, close_position, true)
	print(path)
	
func navigate():
	if path.size() > 0:
		collision = global_position.direction_to(path[1]) * SPEED
		if global_position == path[0].floor():
			path.remove(0)
	
func move(delta):
	collision = move_and_collide(collision * delta)
	
func check_global_pos(close_position):
	if global_position.distance_to(close_position) < 5:
		chance = rng.randi_range(0, 1)
		if chance:
			a = rng.randf_range(-100.0, 100.0)
			b = rng.randf_range(-100.0, 100.0)
			while global_position.x + a > screen_size.x || global_position.x + a < 0:
				a = rng.randf_range(-100.0, 100.0)
			while global_position.y + b > screen_size.y || global_position.y + b < 0:
				b = rng.randf_range(-100.0, 100.0)
			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
		else:
			state = IDLE
	elif collision:
		if "Town_folk_man" in collision.collider.name:
			print("collision of "+ String(collision.collider.name))
			state = DISCUSSING
		a = rng.randf_range(-100.0, 100.0)
		b = rng.randf_range(-100.0, 100.0)
		while global_position.x + a > screen_size.x || global_position.x + a < 0:
			a = rng.randf_range(-100.0, 100.0)
		while global_position.y + b > screen_size.y || global_position.y + b < 0:
			b = rng.randf_range(-100.0, 100.0)
		self.close_position = Vector2(global_position.x +  a, global_position.y + b)
	
	
func _physics_process(delta):
	match state:
		IDLE:
			animated_sprite.animation = "idle"
#			yield(get_tree().create_timer(rng.randi_range(1, 5)), "timeout")
			yield(get_tree().create_timer(1.0), "timeout")
			state = WALK
		WALK:
			check_global_pos(close_position)
			generate_path()
			navigate()
			move(delta)
			if global_position.x > close_position.x:
				animated_sprite.flip_h = true
			else:
				animated_sprite.flip_h = false
			animated_sprite.animation = "walk"
		DISCUSSING:
			animated_sprite.animation = "idle"
			$bubble.show()
#			yield(get_tree().create_timer(rng.randi_range(5, 10)), "timeout")
			yield(get_tree().create_timer(10.0), "timeout")
#			print("ended")
			$bubble.hide()
			state = WALK


func _on_Town_folk_man_input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		pass
#		if GameManager.clicked_kill == true:
#			queue_free()
#			GameManager.team.erase(self)
#		elif GameManager.clicked_increase_fear == true:
#			self.fear += 50
#			print(fear)

