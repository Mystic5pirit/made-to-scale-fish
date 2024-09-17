class_name Scale
extends Node2D

@onready var sprite = $ScaleScaler/Scale
@onready var animation_player = $AnimationPlayer
@onready var incomplete_removal_audio_player = $IncompleteRemovalAudioPlayer
@onready var complete_removal_audio_player = $CompleteRemovalAudioPlayer

var is_active: bool = false
signal removed()

var move_target: Vector2
var initial_position: Vector2

var scale_health: float
# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = position
	var rand_angle: float = randf_range(-PI/2, PI/2)
	move_target = position + (Vector2.RIGHT.rotated(rand_angle) * 500)
	sprite.material = sprite.material.duplicate()
	scale_health = (Stats.fish_scaled + 2) / 2

var is_scale_removed: bool = false
var time_since_scale_removed: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_scale_removed:
		time_since_scale_removed += delta
		position = lerp(initial_position, move_target, time_since_scale_removed*2)
		if time_since_scale_removed >= 0.5:
			queue_free()
	pass


func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("mouse_down") and is_active and not is_scale_removed:
		get_viewport().set_input_as_handled()
		scale_pressed()

func scale_pressed():
	scale_health -= Stats.strength
	if scale_health <= 0:
		scale_removed()
	else:
		animation_player.play("Wiggle")
		incomplete_removal_audio_player.play()

func set_active():
	is_active = true
	sprite.material.set_shader_parameter("outline_color", Color.WHITE)

func scale_removed():
	complete_removal_audio_player.play()
	removed.emit()
	is_scale_removed = true
