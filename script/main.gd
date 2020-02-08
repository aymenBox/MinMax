extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	g.numbers[0]=randi()%10
	g.numbers[1]=randi()%10
	g.numbers[2]=randi()%10
	$numbers/number1.set_text(str(g.numbers[0]))
	$numbers/number2.set_text(str(g.numbers[1]))
	$numbers/number3.set_text(str(g.numbers[2]))
	g.reset_mm()
	print(g.mm)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $time_c/time_bar.value<100:
		$time_c/time_bar.value+=0.6
		$player.rotation_degrees+=PI * g.speed
		if $player.rotation_degrees>365:
			$player.rotation_degrees=0
	else:
		print("player lost")
		set_process(false)
		set_process_input(false)
		g.lost()
#	pass

func _input(event):
	if event is InputEventScreenTouch and g.colliding:#bug fixed by fadi ksour
		if event.pressed:
			print("pressed")
			if g.check():
				print("true")
				$time_c/time_bar.value=0
				g.score+=1
				$score_label/score.set_text(str(g.score))
				$score_sound.play(0)
				g.reset_number()
				g.reset_mm()
				if g.score%3==0:
					g.speed+=0.1
			else:
				print("false")
				print("player lost")
				set_process(false)
				set_process_input(false)
				g.lost()
	elif event is InputEventScreenTouch and !g.colliding:
		if event.pressed:
			print("false")
			print("player lost")
			set_process(false)
			set_process_input(false)
			g.lost()
	pass


func _on_number1_body_entered(body):
	g.number = int($numbers/number1.get_text())
	print(g.number)
	g.colliding=true
	pass # Replace with function body.


func _on_number1_body_exited(body):
	g.colliding=false
	pass # Replace with function body.


func _on_number2_body_entered(body):
	g.number = int($numbers/number2.get_text())
	print(g.number)
	g.colliding=true
	pass # Replace with function body.


func _on_number2_body_exited(body):
	g.colliding=false
	pass # Replace with function body.


func _on_number3_body_entered(body):
	g.number = int($numbers/number3.get_text())
	print(g.number)
	g.colliding=true
	pass # Replace with function body.


func _on_number3_body_exited(body):
	g.colliding=false
	pass # Replace with function body.
