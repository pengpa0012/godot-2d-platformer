extends CharacterBody2D


const SPEED = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += (SPEED + Global.score) * delta

	move_and_slide()
