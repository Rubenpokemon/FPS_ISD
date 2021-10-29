extends Spatial


var damage = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Test")
	translation.x = rand_range(-1.2,1.2)
	translation.y = 0.93
	translation.z = rand_range(-1.8,1)
	scale.x = 0.692
	scale.y = 0.222
	scale.z = 0.692


func _on_Timer_timeout():
	$AnimationPlayer.play("Pop Up")


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		body.hit(damage)
