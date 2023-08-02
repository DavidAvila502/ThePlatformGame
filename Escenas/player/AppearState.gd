extends State
class_name AppearState

var Player

func _ready():
	Player = get_parent().get_parent()
	Player.animation.connect("animation_finished",_on_animation_finished)
	
func _physics_process(delta):
	Player.velocity.y -= 9
	Player.animation.play("appear")
	
	
	
func _on_animation_finished():
	Player.appearsSound.play()
	
	if Player.is_on_floor():
		get_parent().change_state('idle')
	else:
		get_parent().change_state('fall')
