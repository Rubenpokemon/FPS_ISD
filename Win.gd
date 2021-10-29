extends Control

func _ready():
	if name == "Win":
		$Points.text = "Points: " + str(Globals.points)

func _on_Button_pressed():
	get_tree().change_scene("res://Main_Menu.tscn")
