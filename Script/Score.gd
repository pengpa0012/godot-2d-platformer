extends Node


func _physics_process(delta):
	self.text = "Score: {score}".format({"score": Global.score})
