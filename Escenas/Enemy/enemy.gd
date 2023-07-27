extends CharacterBody2D

class_name  Enemy

var direction := -1
var speed :=50
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 9
var health := 2
var is_hit = false

@onready var rayLeft := $RayCast2D
@onready var rayRight := $RayCast2D2
@onready var animation := $AnimatedSprite2D
@onready var rayFloorLeft := $AnimatedSprite2D/rayFlooorLeft
@onready var rayFloorRight := $AnimatedSprite2D/rayFloorRight


func _process(delta):
	if(rayLeft.is_colliding()):
		direction = 1
	if(rayRight.is_colliding()):
		direction = -1
	
	if not rayFloorLeft.is_colliding():
		direction = 1
	if not rayFloorRight.is_colliding():
		direction = -1		
	
	
func _physics_process(delta):
	
	if is_hit:
		return
	
	if health <=0:
		die()
		return
	
	animation.flip_h = true if direction == 1 else false
	
	velocity.x = direction * speed
	velocity.y += gravity
	move_and_slide() 



func _on_atack_area_body_entered(body):
	if body is Player:
		body.takeDamage(20,direction)
	
func die():
	animation.play('dying')
	await animation.animation_finished
	Global.enemyDestroySound()
	self.queue_free()

func _on_damage_area_body_entered(body):
	if body is Player:
		is_hit = true
		health -= 1
		Global.smashEnemySound()
		animation.play('hit')
		await animation.animation_finished
		is_hit = false
		animation.play("walk")
