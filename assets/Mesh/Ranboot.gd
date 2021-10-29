extends KinematicBody

var target
var move = "None"
var speed = 3000
var spin = 3 # +3 or -3
var hp = 50
var direction
var gravity = 100

func _ready():
	randomize()
	$"Health Bar".set_starting_hp(hp)

func _on_Sight_body_entered(body):
	if body.is_in_group("Player"):
		$Attack.start()
		target = body


func _process(delta):
	if target:
		if move == "None": #Move towards player while not attacking
			if not is_on_floor():
				translation.y -= gravity * delta
			look_at(target.global_transform.origin, Vector3.UP)
			rotation_degrees.x = 0
			direction = (target.transform.origin - transform.origin).normalized()
			direction.y = 0
			move_and_slide(direction * (speed/4) * delta, Vector3.UP)

		if move == "Flamethrower": #Spain without the a
			rotate_y(delta * spin) 

		if move == "Tackle":
			move_and_slide(direction * speed * delta, Vector3.UP)


func Tackle():
	direction = (target.transform.origin - transform.origin).normalized()
	direction.y = 0
	look_at(target.global_transform.origin, Vector3.UP)
	rotation_degrees.x = 0
	$Tackle.start()


func _on_Flamethrower_body_entered(body):
	if body.is_in_group("Player"):
		body.hit(10)

func _on_Spin_timeout():
#	if spin >= 1: #If spin is positive
#		spin = -spin #Reverses Spin
#		$Spin.start() #Starts Timer agian
#	else:
		$Flamethrower.hide()
		$Flamethrower/CollisionShape.disabled = true
		$AnimationPlayer.play_backwards("Flamethrower_Start")
		end_move()


func _on_Tackle_timeout():
	end_move()

func end_move():
	direction = null
	move = "None"
	$Attack.start()

func _on_Attack_timeout():
	if move == "None":
		var rng = randi()%2
		if rng == 0:
			$Spin.start()
			move = "Flamethrower"
			$Flamethrower.show()
			$Flamethrower/CollisionShape.disabled = false
			$AnimationPlayer.play("Flamethrower_Start")
		else:
			Tackle()
			move = "Tackle"


func _on_Bite_Range_body_entered(body):
	if body.is_in_group("Player"):
		$Bite.start()
		body.hit(1)

func _on_Bite_timeout():
	var overlap = $Bite_Range.get_overlapping_bodies()
	if overlap.has(target):
		print ("Bite")
		$Bite.start()


func bullet_hit(damage, _bullet_hit_pos):
	hp -= damage
	$"Health Bar".update(damage)
	if hp <= 0:
		Globals.points += 100
		queue_free()
