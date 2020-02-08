extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if ad.admob != null :
		ad.admob.showInterstitial()
	if ad.admob != null :
		ad.admob.showBanner()
	var s=sls.load_scoor()
	$score/score_l.set_text(str(s))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_b_pressed():
	if ad.admob != null: 
		ad.admob.hideBanner()
	get_tree().change_scene("res://scene/main.tscn")
	pass # Replace with function body.


func _on_help_b_pressed():
	get_tree().change_scene("res://scene/help.tscn")
	pass # Replace with function body.


func _on_about_b_pressed():
	get_tree().change_scene("res://scene/about.tscn")
	pass # Replace with function body.
