extends StaticBody2D

var wheight : int
var  hieght : int

func _ready():
	hieght = $ColorRect.get_size().y

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent()._speed * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent()._speed * delta
	position.y = clamp(position.y , 0 , 566)
	
