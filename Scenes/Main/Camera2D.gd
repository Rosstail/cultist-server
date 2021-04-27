extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		if self.position.x + 10 < self.limit_right:
			self.position.x += 10 
		else:
			self.position.x = self.limit_right
	if Input.is_action_pressed("ui_left"):
		if self.position.x - 10 > self.limit_left:
			self.position.x -= 10 
		else:
			self.position.x = self.limit_left
	if Input.is_action_pressed("ui_up"):
		if self.position.y - 10 > self.limit_top:
			self.position.y -= 10
		else:
			self.position.y = self.limit_top
	if Input.is_action_pressed("ui_down"):
		if self.position.y + 10 < self.limit_bottom:
			self.position.y += 10 
		else:
			self.position.y = self.limit_bottom


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
