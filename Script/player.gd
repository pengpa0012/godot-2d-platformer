extends CharacterBody2D


const SPEED = 300.0
@onready var screen

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		body.queue_free()
