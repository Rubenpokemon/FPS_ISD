extends Spatial

var target
var damage = 10
var bullet_scene = preload("res://Bullet_Scene.tscn")

var alive = "Yes"

func _ready():
	$AnimationPlayer.play_backwards("Aiming")


func _process(delta): #Looks at player when there is a target
	if target:
		look_at(target.global_transform.origin, Vector3.UP)
		rotation_degrees.x = 0


func _on_Sight_body_entered(body): #Decects Player
	if body.is_in_group("Player"):
		print("Player Spotted")
		target = body
		$Shooting.start()

func _on_Sight_body_exited(body): #Decects when player leaves vision
	if body.is_in_group("Player"):
		target = null

func _on_Shooting_timeout(): #Shooting
	if target != null:
		$AnimationPlayer.play("Shooting")
		$Shooting.start()

		var clone = bullet_scene.instance() #Makes bullet
		get_tree().get_root().add_child(clone)

		clone.global_transform = $Roboto/Gun.global_transform
		clone.scale = Vector3(8, 8, 8)
		clone.BULLET_DAMAGE = damage
		clone.BULLET_SPEED = 60
		clone.rotation_degrees.x = 180

