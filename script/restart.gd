extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_restart_b_pressed():
	g.restart()
	pass # Replace with function body.


func _on_menu_b_pressed():
	get_tree().change_scene("res://scene/menu.tscn")
	pass # Replace with function body.


func _on_contenu_b_pressed():
	if ad.admob != null:
		ad.admob.showRewardedVideo()
	pass # Replace with function body.
