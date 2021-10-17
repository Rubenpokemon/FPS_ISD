extends Control

var all_lines
var current_line = 0
var total_lines

func talk(lines, num):
	$Sprite.frame = num
	total_lines = lines.size()
	$Label.visible_characters = 0
	show()
	print (lines[0])
	all_lines = lines
	$Text_Timer.start()

func _on_Text_Timer_timeout():
	$Label.text = all_lines[current_line]
	$Label.visible_characters += 1

func _input(event):
	if event.is_action_pressed("Skip_Text") and is_visible_in_tree():
		current_line += 1
		$Text_Timer.stop()
		if current_line == total_lines:
			reset()
		else:
			$Text_Timer.start()
			$Label.visible_characters = 0
	elif event.is_action_pressed("End Text") and is_visible_in_tree():
		reset()

func reset():
	hide()
	current_line = 0
