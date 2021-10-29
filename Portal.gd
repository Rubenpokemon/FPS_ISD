extends Sprite3D



func _on_Area_body_entered(body): #Send player to boss level
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Boss.tscn")
