class_name Fish
extends Node2D


const FISH_SCALE = preload("res://scale.tscn")

@onready var column_0: Node2D = $Column0
@onready var column_1: Node2D = $Column1
@onready var column_2: Node2D = $Column2
@onready var column_3: Node2D = $Column3
@onready var column_4: Node2D = $Column4
@onready var column_5: Node2D = $Column5
@onready var column_6: Node2D = $Column6
@onready var column_7: Node2D = $Column7
@onready var column_8: Node2D = $Column8

@onready var column_array: Array[Node2D] = [column_0, column_1, column_2, column_3, column_4, column_5, column_6, column_7, column_8]

signal finished_fish()

var scales_per_column: Array[int] = []
var active_column: int = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	for column: Node2D in column_array:
		var nodes: Array[Node] = column.get_children()
		for node in nodes:
			var fish_scale = FISH_SCALE.instantiate()
			node.add_child(fish_scale)
			fish_scale.removed.connect(_on_scale_removed)
			fish_scale.removed.connect(Stats._on_scale_removed)
		scales_per_column.append(nodes.size())
	
	# Sets the right column to be active
	var nodes = column_array[active_column].get_children()
	for node in nodes:
		var fish_scale: Scale = node.get_child(0)
		fish_scale.set_active()
	
func _on_scale_removed():
	scales_per_column[active_column] -= 1
	if scales_per_column[active_column] == 0 and active_column > 0:
		active_column -= 1
		# Sets the right column to be active
		var nodes = column_array[active_column].get_children()
		for node in nodes:
			var fish_scale: Scale = node.get_child(0)
			fish_scale.set_active()
	elif scales_per_column[active_column] == 0 and active_column == 0:
		finish_fish()

var is_finished: bool = false
func finish_fish():
	is_finished = true

var time_since_finished: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_finished:
		time_since_finished += delta
		position.x = lerpf(805, 1800, clampf(time_since_finished, 0, 1))
		if time_since_finished >= 1.5:
			finished_fish.emit()
			queue_free()
