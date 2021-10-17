extends KinematicBody

var hp = 120

func bullet_hit(damage, _bullet_hit_pos):
	hp -= damage
	if hp <= 0:
		print ("Timer Start")
		$Timer.start()
		#$CollisionShape.disabled = true
		#hide()
		queue_free()



func _on_Timer_timeout():
	print ("Timer Done")
	#get_parent().queue_free()
# warning-ignore:return_value_discarded
	#get_tree().change_scene("res://Tunnels.tscn")
