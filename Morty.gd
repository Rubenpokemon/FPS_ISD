extends MeshInstance

var talked = "No"
var num = 1
var player

var lines = ["Aww jeez man, you gotta free me :(",
 "I'll take you to the boss, aww jeez.",
 "Come on man, just free me from these cuffs, just press 'Q' man!",
"Ill even dap you up G!"]




func _on_Area_body_entered(body):
	if body.is_in_group("Player") and talked == "No":
		body.talk(lines, num)
		player = body
		talked = "Yes"

func _input(event):
	if event.is_action_pressed("Use") and talked == "Yes":
		$AnimationPlayer.play("Leave")
		player.talk(["Respect G","Ill open up a portal for you","Just go kill the big boss","Just skip the whole dungeon thing, you don't have time for that!"], num)
		
