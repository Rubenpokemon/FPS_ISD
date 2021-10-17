extends MeshInstance

var talked = "No"
var num = 1
var player

var lines = ["Aww jeez man, you gotta free me :(",
 "I know a way out of here, just free me, aww jeez.",
 "Come on man, just look at them and take them off!",
"Ill even dap you up G!"]




func _on_Area_body_entered(body):
	if body.is_in_group("Player") and talked == "No":
		body.talk(lines, num)
		player = body
		talked = "Yes"

func _input(event):
	if event.is_action_pressed("Use") and talked == "Yes":
		$AnimationPlayer.play("Leave")
		player.talk(["Aww jeez I promise to come back but I have a math class right now!"], num)
		
