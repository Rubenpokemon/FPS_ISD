extends KinematicBody


export var starting_hp = 100
var hp


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = starting_hp


func bullet_hit(damage, _bullet_hit_pos):
	hp -= damage
	if hp <= 0:
		get_parent().queue_free()
