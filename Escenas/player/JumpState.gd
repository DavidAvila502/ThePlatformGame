extends State
class_name JumpState

var Player

func _ready():
	Player = get_parent().get_parent()

func _physics_process(delta):
	
	if Player.is_on_floor():
		Player.velocity.y -= jump
		Player.animation.play("jump")
	
	Player.animation.flip_h =  direction < 0 if direction != 0 else Player.animation.flip_h
	
	if Input.is_action_pressed("d"):
		direction = 1
		Player.velocity.x = direction * speed
		
	if Input.is_action_pressed("a"):
		direction = -1
		Player.velocity.x = direction * speed

	if Player.velocity.y > 0:
		get_parent().change_state('fall')
		
		
