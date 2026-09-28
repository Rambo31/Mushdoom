class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle: State = $"../Idle"


## actions apon entering a state
func Enter() -> void:
	player.UpdateAnimation('walk')
	pass

## actions apon exiting a state
func Exit() -> void:
	pass
## actions within _process update of a state
func Process( _delta: float ) -> State:
	if player.inputed_dir == Vector2.ZERO:
		return idle
		
	player.velocity = move_speed * player.inputed_dir
	if player.SetDirection():
		player.UpdateAnimation('walk')
	return null

## actions within _physics_process update of a state
func Physics( _delta: float ) -> State:
	return null
	
## actions for input events of a state
func HandleInput( _event: InputEvent ) -> State:
	return null
