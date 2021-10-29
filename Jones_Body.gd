extends KinematicBody

export var starting_hp = 700 
var hp


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = starting_hp
	$"HealthBar".set_starting_hp(hp)


func bullet_hit(damage, _bullet_hit_pos):
	hp -= damage
	$"HealthBar".update(damage)
	if hp <= 0:
		Globals.points += 100
		get_parent().queue_free()
		get_tree().change_scene("res://WinScreen.tscn")
