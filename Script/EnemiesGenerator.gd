extends Node2D

const enemy_scene = preload("res://Scenes/enemy.tscn")

func _process(delta):
	if Global.score >= 100:
		$Timer.wait_time = 1.0
	if Global.score >= 150:
		$Timer.wait_time = 0.5
	if Global.score >= 200:
		$Timer.wait_time = 0.25
		
func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position.x = randf_range(50, get_viewport_rect().size.x)
	enemy.position.y = -50
	add_child(enemy)


func _on_timer_timeout():
	spawn_enemy()
