extends Node
var speed = 1
var colliding = false
var number = 0
var numbers=[0,0,0]
var mm 
var score=0
var main_s = preload("res://scene/main.tscn")
var restart_s = preload("res://scene/restart.tscn")

func check():
	if mm ==0:
		if number <=numbers[0] and number <=numbers[1] and number <=numbers[2]:
			return true
		else:
			return false
	else:
		if number>=numbers[0] and number>=numbers[1] and number>=numbers[2]:
			return true
		else:
			return false
	pass

func reset_mm():
	mm = randi()%2
	if mm==0:
		$'/root/main/mm'.set_text("Min")
		$'/root/main/mm_s'.set_modulate("00ff87")
	else:
		$'/root/main/mm'.set_text("Max")
		$'/root/main/mm_s'.set_modulate("ff0054")

func reset_number():
	if number==numbers[0]:
		g.numbers[0]=randi()%10
		$'/root/main/numbers/number1'.set_text(str(g.numbers[0]))
	elif number==numbers[1]:
		g.numbers[1]=randi()%10
		$'/root/main/numbers/number2'.set_text(str(g.numbers[1]))
	elif number==numbers[2]:
		g.numbers[2]=randi()%10
		$'/root/main/numbers/number3'.set_text(str(g.numbers[2]))
	pass

func restart():
	get_tree().reload_current_scene()
	speed=1
	score=0
	colliding=false
	numbers=[0,0,0]


func lost():
	sls.check_score(score)
	$"/root/main".add_child(restart_s.instance())
	pass