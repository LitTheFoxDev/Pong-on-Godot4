extends ColorRect

var scour := [0,0]
@export var _speed :=500


func _on_timer_timeout():
	$Ball.new_ballz()


func _on_scrour_right_body_entered(body):
	$AudioStreamPlayer.play()
	$Timer.start()


func _on_scrour_left_body_entered(body):
	$AudioStreamPlayer.play()
	$Timer.start()
