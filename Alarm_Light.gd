extends OmniLight

var dir = "Up"

var max_range = 100
var min_range = 50
var rate = 1


func _process(delta):

	if dir == "Up":
		omni_range += rate
		if omni_range >= max_range:
			dir = "Down"

	else:
		omni_range -= rate
		if omni_range <= min_range:
			dir = "Up"
