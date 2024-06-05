extends StaticBody2D

var wheres_ball : Vector2
var move : int
var dist : int 
var hieght : int
func _ready():
	hieght = $ColorRect.get_size().y

func _process(delta):
	wheres_ball = $"../Ball".position
	dist = position.y - wheres_ball.y
	if abs(dist) > get_parent()._speed * delta:
		move = get_parent()._speed * delta * (dist / abs(dist))
	else:
		move = dist 
	position.y -= move
	position.y = clamp(position.y , 0 , 566)
