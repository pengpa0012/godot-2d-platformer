extends Node2D

const enemy_scene = preload("res://Scenes/enemy.tscn")

func spawn_enemy():
	var enemy = enemy_scene.instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
	enemy.position.x = randf_range(50, get_viewport_rect().size.x)
	add_child(enemy)


func _on_timer_timeout():
	spawn_enemy()
