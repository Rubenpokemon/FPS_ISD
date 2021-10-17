extends Sprite3D


func _ready():
	texture = $Viewport.get_texture()
	pass

func update(amount):
	$Viewport/HealthBar.value -= amount

func set_starting_hp(hp):
	$Viewport/HealthBar.max_value = hp
	$Viewport/HealthBar.value = hp
