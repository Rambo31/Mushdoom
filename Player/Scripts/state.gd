class_name State extends Node

static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

## actions apon entering a state
func Enter() -> void:
	pass

## actions apon exiting a state
func Exit() -> void:
	pass
## actions within _process update of a state
func Process( _delta: float ) -> State:
	return null

## actions within _physics_process update of a state
func Physics( _delta: float ) -> State:
	return null
	
## actions for input events of a state
func HandleInput( _event: InputEvent ) -> State:
	return null
