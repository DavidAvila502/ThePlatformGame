extends CharacterBody2D
class_name Player

var speed := 120
var jump := 250
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 9
var direccion := 0.0
var enemyDirection = 0.0
var health := 100
var is_hit = false
var impact = false
var appear = false

@onready var animation := $AnimatedSprite2D


func _ready():
	animation.play("appear")
	$appears.play()
	await animation.animation_finished
	appear = true

func _physics_process(delta):
	
	if health <=0:
		die()
		return
	
	if  not appear:
		return
	
	if impact and is_hit:
		velocity.y -= 150
		impact = false
		
	if is_hit:
		velocity.y += gravity
		velocity.x -=12 * enemyDirection
		move_and_slide()
		return		
		
		
	direccion = Input.get_axis("a","d")
	velocity.x = direccion * speed
		
	if is_on_floor() and Input.is_action_just_pressed("w"):
		$audio_jump.play()		
		velocity.y -= jump
		
	if not is_on_floor():
		velocity.y += gravity
		
		
	move_and_slide()
	
	set_animation()
	
	
func set_animation():
	if velocity.x == 0:
		animation.play("idle")
	if velocity.x > 0:
		animation.play("run")
	if velocity.x < 0:
		animation.play('run')
	if velocity.y < 0:
		animation.play("jump")
		
	if velocity.y > 0:
		animation.play("fall")
		
	animation.flip_h = direccion < 0 if direccion != 0 else animation.flip_h
		
	
func takeDamage(damage,lastEnemyDirection):
	health = health - damage

	if damage and lastEnemyDirection:
		enemyDirection = lastEnemyDirection
		if health > 0:
			is_hit = true
			impact = true
			animation.play("hit")
			await animation.animation_finished
			is_hit = false
		

func die():
	animation.play("die")
	await  animation.animation_finished
	Global.playerDieSound()
	self.queue_free()
	
