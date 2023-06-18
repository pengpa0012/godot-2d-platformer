extends CharacterBody2D


const SPEED = 300.0
const VELOCITY = Vector2(0,-1)


func _physics_process(delta):
	var collision_info = move_and_collide(VELOCITY.normalized() * delta * SPEED)


func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		self.queue_free()
		body.queue_free()
