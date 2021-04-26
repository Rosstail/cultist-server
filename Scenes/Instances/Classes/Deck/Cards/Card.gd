extends TextureButton

class_name Card

var id
var title
var desc
var display
#var picture
#var back 

func _ready():
	set_expand(true)
	set_stretch_mode(self.STRETCH_KEEP_ASPECT)
	set_h_size_flags(3)
	set_v_size_flags(3)
#	self.set_custom_minimum_size(Vector2(70, 95))
	
	
func _init(id, dict):
	self.id = id
	self.title = dict["title"]
	self.desc = dict["desc"]
	self.display = dict["display"]
	#self.picture = load("res://Assets/Cards/Pictures/Characters/card-" + title + ".png")
	#set_normal_texture(picture)
	
func _pressed():
	print(self.title)
