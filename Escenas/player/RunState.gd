extends State
class_name RunState

var Player

func _ready():
	Player = get_parent().get_parent()

func _physics_process(delta):
	
	Player.animation.flip_h = true if direction < 0 else false
	if Input.is_action_pressed("w"):
		get_parent().change_state('jump')
	
	if Input.is_action_pressed("d"):
		direction = 1
		Player.velocity.x = direction * speed
		Player.animation.play("run")
		
	elif Input.is_action_pressed("a"):
		direction = -1
		Player.velocity.x = direction * speed
		Player.animation.play("run")
	
	else:
		get_parent().change_state('idle')

