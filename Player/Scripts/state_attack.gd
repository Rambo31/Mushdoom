class_name State_Attack extends State

var isAttacking: bool = false
@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate_speed : float = 5.0

@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
#character's player
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

## actions apon entering a state
func Enter() -> void:
	player.UpdateAnimation('attack')
	attack_anim_player.play('attack_' + player.GetAnimationDirection())
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range( 0.9, 1.1 )
	audio.play()
	isAttacking = true
	pass

## actions apon exiting a state
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	isAttacking = false
	pass
## actions within _process update of a state
func Process( _delta: float ) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if isAttacking == false && player.inputed_dir == Vector2.ZERO:
		return idle
	
	if isAttacking == false && player.inputed_dir != Vector2.ZERO:
		return walk
		
	return null

## actions within _physics_process update of a state
func Physics( _delta: float ) -> State:
	return null
	
## actions for input events of a state
func HandleInput( _event: InputEvent ) -> State:
	return null
	
func EndAttack( _newAnimName : String ) -> void: 
	isAttacking = false
	return
