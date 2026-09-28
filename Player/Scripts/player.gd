class_name Player extends CharacterBody2D

var cardinal_dir : Vector2 = Vector2.DOWN
var inputed_dir : Vector2 = Vector2.ZERO

@onready var state_machine: Player_State_Machine = $StateMachine
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	inputed_dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	inputed_dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()

func SetDirection() -> bool:
	var new_dir : Vector2
	
	#in case nothing was pressed
	if inputed_dir == Vector2.ZERO:
		return false

	#what's new cardinal direction
	if inputed_dir.y == 0:
		new_dir = Vector2.LEFT if inputed_dir.x < 0 else Vector2.RIGHT
	if inputed_dir.x == 0:
		new_dir = Vector2.UP if inputed_dir.y < 0 else Vector2.DOWN
		
	#cardinal direction remained the same
	if new_dir == cardinal_dir:
		return false
	
	cardinal_dir = new_dir
	#transform here instead of flipping
	sprite.scale.x = -1 if cardinal_dir == Vector2.LEFT else 1
	return true
	
func UpdateAnimation( state : String ) -> void:
		animation_player.play( state + '_' + GetAnimationDirection() )
		pass
		
func GetAnimationDirection() -> String:
		if cardinal_dir == Vector2.UP:
			return 'up'
		elif cardinal_dir == Vector2.DOWN:
			return 'down'
		else:
			return 'side'
