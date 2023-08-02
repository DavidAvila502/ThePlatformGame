extends State
class_name IdleState

var Player

func _ready():
	Player = get_parent().get_parent()
	
func _physics_process(delta):
	Player.animation.flip_h =  direction < 0 if direction != 0 else Player.animation.flip_h
	
	Player.animation.play("idle")
		
	if Input.is_action_just_pressed("d"):
		get_parent().change_state("run")
	elif Input.is_action_just_pressed("a"):
		get_parent().change_state("run")
	elif Input.is_action_just_pressed("w"):
		get_parent().change_state('jump')
		
	Player.velocity.x = lerp(Player.velocity.x,0.0,0.2)
	
	
	
	
	
