extends CharacterBody2D

var  win_size : Vector2
var start_speed : int = 500
var acs : int = 45
var ball_speed : int 
var dic : Vector2

func  _ready(): 
	win_size = get_viewport_rect().size
	

func new_ballz():
	position.x = win_size.x / 2
	position.y = randi_range(200 , win_size.y-200)
	ball_speed = start_speed
	dic = ran_dic()
	
func ran_dic():
	var new_dic = Vector2()
	new_dic.x = [1, -1].pick_random()
	new_dic.y = randf_range(1,-1)
	return new_dic.normalized()
	
func _physics_process(delta):
	var col = move_and_collide(dic * ball_speed * delta)
	var cols
	if col:
		cols = col.get_collider()
		if cols == $"../Human" or cols == $"../CPU":
			$"../AudioStreamPlayer2".play()
			ball_speed += acs
			dic = new_dic(cols)
		else:
			dic = dic.bounce(col.get_normal())

func new_dic(col):
	var where = position.y
	var pad = col.position.y
	var dis = where - pad
	var _new = Vector2()
	if dic.x > 0 :
		_new.x = -1
	else:
		_new.x = 1
	_new.y = (dis / (col.hieght/2)) + 0.6 
	return _new.normalized()
