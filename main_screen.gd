extends Node2D

const FISH = preload("res://fish.tscn")
var fish_size = Vector2(2.139, 2.05)
var fish: Node2D
var fish_in_final_position: bool = false
var time_since_fish_spawned: float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	fish = FISH.instantiate()
	add_child(fish)
	fish.position.x = -300
	fish.position.y = 324
	fish.scale = fish_size
	fish.finished_fish.connect(_on_fish_finished_fish)
	fish.finished_fish.connect(Stats._on_fish_finished_fish)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not fish_in_final_position:
		time_since_fish_spawned += delta
		fish.position.x = lerpf(-300, 805, clampf(time_since_fish_spawned,0,1))
		if time_since_fish_spawned >= 1:
			fish_in_final_position
	pass

func _on_fish_finished_fish():
	fish = FISH.instantiate()
	add_child(fish)
	fish.position.x = -300
	fish.position.y = 324
	fish.scale = fish_size
	fish.finished_fish.connect(_on_fish_finished_fish)
	fish.finished_fish.connect(Stats._on_fish_finished_fish)
	time_since_fish_spawned = 0
	pass
