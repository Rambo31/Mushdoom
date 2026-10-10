class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"

## actions apon entering a state
func Enter() -> void:
	player.UpdateAnimation('idle')
	pass

## actions apon exiting a state
func Exit() -> void:
	pass
## actions within _process update of a state
func Process( _delta: float ) -> State:
	if player.inputed_dir != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

## actions within _physics_process update of a state
func Physics( _delta: float ) -> State:
	return null
	
## actions for input events of a state
func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed('attack'):
		return attack
	return null
