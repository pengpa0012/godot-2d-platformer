extends Node2D

func _ready():
	Global.score = 0
	Global.life = 5

func _process(delta):
	$Score.text = "Score: {score}".format({"score": Global.score})
	$Life.text = "Life: {life}".format({"life": Global.life})


# TODO
# -Add Assets
#	-Bullet/Player/Enemies/BG
# -Add bullet/death/hurt particles
