extends CharacterBody2D


const SPEED = 300.0
@onready var screen
const bullet_scene = preload("res://Scenes/bullet.tscn")
@onready var _pivot = $Gun/Marker2D

func _physics_process(delta):
	
	var mouse_position = get_global_mouse_position()
	_pivot.look_at(mouse_position)
	
	if !get_node("Ouch").playing:
		if Global.life == 0:
			self.queue_free()
			get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
			
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		Global.life -= 1
		get_node("Ouch").play()
		body.queue_free()
		

func shoot():
	var bullet = bullet_scene.instantiate()
	get_node("PewSound").play()
	get_parent().add_child(bullet)
	
	bullet.position = $Gun/Marker2D.global_position
	bullet.velocity = (get_global_mouse_position() - bullet.position).normalized()
	print(bullet.velocity)
