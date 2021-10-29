extends KinematicBody

var gravity = 100
var target
var direction
var speed = 1000
var hp = 50
var damage = 5

func _ready():
	$"HealthBar".set_starting_hp(hp)
	print ("Spawn")
func _process(delta):


	if target:
		if not is_on_floor():
			translation.y -= gravity * delta
		look_at(target.global_transform.origin, Vector3.UP)
		rotation_degrees.x = 0
		direction = (target.transform.origin - transform.origin).normalized()
		direction.y = 0
		move_and_slide(direction * (speed) * delta, Vector3.UP)



func _on_Sight_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		$Attack2.start()


func bullet_hit(damage, _bullet_hit_pos):
	hp -= damage
	$"HealthBar".update(damage)
	if hp <= 0:
		Globals.points += 100
		queue_free()


func _on_Attack2_timeout():
	var colliders = $Attack.get_overlapping_bodies()
	if colliders.has(target):
		target.hit(damage)
		$Attack2.start()

func _on_Attack_body_entered(body):
	if body.is_in_group("Player"):
		$Attack2.start()
