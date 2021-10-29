extends MeshInstance

var pop_up = preload("res://PopUp.tscn")
var pops_left = 0

var next_move = "Stand"
var points_to_remove = 10

func _ready():
	pop_attack()


func pop_attack(): # Starts pop up attacks
	translation.x = 0
	go_to_middle()
	pops_left = round(rand_range(3,5)) 
	$Pop.start()

func go_to_middle(): #Goes under map
	translation.x = 0
	translation.y = -60
	translation.z = 0
	Globals.points -= points_to_remove
	points_to_remove += 10


func _on_Pop_timeout(): #Spawns pop up attacks
	var pop_attack = pop_up.instance()
	add_child(pop_attack)
	pops_left -= 1
	if pops_left >= 1:
		$Pop.start()
	else:
		$Cooldown.start()


func go_to_open(): # Goes to where it can be attacked
	for i in round(rand_range(1,2)) :
		get_parent().spawn_enemy()
	translation.x = 0
	translation.y = 0
	translation.z = -80


func _on_Cooldown_timeout(): #Cooldown bewtween attacks
	if next_move == "Stand":
		go_to_open()
		next_move = "Pop"
		$Cooldown.start()
	else:
		pop_attack()
		next_move = "Stand"
