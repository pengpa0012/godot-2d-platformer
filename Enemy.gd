extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = get_node("../../Players/Player")
@onready var enemy = get_node("AnimatedSprite2D")
@onready var enemyCollisionShape = get_node("CollisionShape2D")
@onready var GLOBAL = get_node("/root/Global")
var chase = false
var SPEED = 200
var isDead = false

var minDistance = -200
var maxDistance = 200
var currentDistance = 0
var moveSpeed = 100
var direction = Vector2.RIGHT


func _physics_process(delta):
	velocity.y += gravity * delta
	
	if velocity.y >= 1000:
		self.queue_free()
		
	if !isDead && player:
		if chase:
			var direction = (player.position - self.position).normalized()	
			enemy.play("Jump")
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			else:
				get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED
		else:
			enemy.play("Idle")
#			Add casual walking here
			velocity.x = 0
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		
		
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		if enemyCollisionShape:
			enemyCollisionShape.queue_free()
		GLOBAL.score += 10
		GLOBAL.enemy_count += 1
		player.velocity.y = -400
		player.get_node("AnimationPlayer").play("Jump")
		isDead = true
		get_node("../../EnemyDeathSound").play()
		enemy.play("Death")
		await(enemy.animation_finished)
		self.queue_free()



func _on_area_2d_3_body_entered(body):
	if body.name == "Player":
		GLOBAL.life -= 1
		body.get_node("HurtSFX").play()
		if(GLOBAL.life == 0):
			body.get_node("AnimationPlayer").play("Death")
			player.queue_free()
			GLOBAL.life = 5
			get_tree().change_scene_to_file("res://death_screen.tscn")
