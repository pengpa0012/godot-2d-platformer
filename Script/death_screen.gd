extends Node2D


func _ready():
	$FinalScore.text = "Final Score: {score}".format({"score": Global.score})


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_button_3_pressed():
	get_tree().quit()
