extends MeshInstance

var lines = ["Screw off!!!", "Little bastard"]




func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		body.talk(lines, 0)
