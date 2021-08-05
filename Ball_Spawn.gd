extends Spatial

var spawns = 100

func _on_Timer_timeout():
	if spawns >= 1:
		var ball = preload("res://Ball.tscn")
		get_parent().add_child(ball)
		spawns -= 1
