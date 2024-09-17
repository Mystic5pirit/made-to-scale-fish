class_name AutoScaler
extends Control

const SCALE_GOLDEN = preload("res://scale_golden.png")
const SCALE_GREY = preload("res://scale_grey.png")
@onready var audio_stream_player = $AudioStreamPlayer

@onready var stored_scales_display = $ColorRect/TextureRect/StoredScalesDisplay
@onready var max_scales_display = $ColorRect/TextureRect/MaxScalesDisplay

@onready var max_fish_level_display = $ColorRect/TextureRect/MaxStoredScales/Text
@onready var fish_time_level_display = $ColorRect/TextureRect/ScaleTime/Text
@onready var max_fish_money_price_display = $ColorRect/TextureRect/MaxStoredScales/MaxFishMoneyButton/Text
@onready var max_fish_gem_price_display = $ColorRect/TextureRect/MaxStoredScales/MaxFishGemButton/Text
@onready var fish_time_money_price_display = $ColorRect/TextureRect/ScaleTime/FishTimeMoneyButton/Text
@onready var fish_time_gem_price_display = $ColorRect/TextureRect/ScaleTime/FishTimeGemButton/Text
@onready var max_fish_money_button = $ColorRect/TextureRect/MaxStoredScales/MaxFishMoneyButton
@onready var fish_time_money_button = $ColorRect/TextureRect/ScaleTime/FishTimeMoneyButton

# Called when the node enters the scene tree for the first time.
func _ready():
	max_scales_display.text = str(Stats.auto_scaler_storage)
	max_fish_level_display.text = str(Stats.auto_scaler_storage)
	fish_time_level_display.text = str(Stats.auto_scaler_speed)
	max_fish_money_price_display.text = str(max_scale_money_price)
	fish_time_money_price_display.text = str(fish_time_money_price)

	pass # Replace with function body.

var stored_time: float = 0
var stored_scales: int = 0
func _process(delta):
	if stored_scales < Stats.auto_scaler_storage:
		stored_time += delta
		while stored_time > Stats.auto_scaler_speed and stored_scales < Stats.auto_scaler_storage:
			stored_time -= Stats.auto_scaler_speed
			stored_scales += 1
			stored_scales_display.text = "[right]" + str(stored_scales)


func _on_back_button_button_up():
	visible = false
	
var max_scale_money_price: int = 100
func _on_max_fish_money_button_button_up():
	if Stats.money_count >= max_scale_money_price:
		Stats.increase_money_amount(-1 * max_scale_money_price)
		Stats.auto_scaler_storage += 10
		Stats.auto_scaler_storage_money_level += 1
		audio_stream_player.play()
	max_scale_money_price = (Stats.auto_scaler_storage_money_level + 1) * 100
	max_fish_money_price_display.text = str(max_scale_money_price)
	if Stats.money_count >= max_scale_money_price:
		max_fish_money_button.texture_normal = SCALE_GOLDEN
	else:
		max_fish_money_button.texture_normal = SCALE_GREY
	pass # Replace with function body.

var fish_time_money_price: int = 100
func _on_fish_time_money_button_button_up():
	if Stats.money_count >= fish_time_money_price:
		Stats.increase_money_amount(-1 * fish_time_money_price)
		Stats.auto_scaler_speed /= 2
		if Stats.auto_scaler_speed < 0.1:
			Stats.auto_scaler_speed = 0.1
		Stats.auto_scaler_speed_money_level += 1
		audio_stream_player.play()
	fish_time_money_price = (Stats.auto_scaler_speed_money_level + 1) * 100
	fish_time_money_price_display.text = str(fish_time_money_price)
	if Stats.money_count >= fish_time_money_price:
		fish_time_money_button.texture_normal = SCALE_GOLDEN
	else:
		fish_time_money_button.texture_normal = SCALE_GREY
	pass # Replace with function body.


func _on_collect_button_button_up():
	Stats.increase_scale_count(stored_scales)
	stored_scales = 0
	stored_scales_display.text = "[right]" + str(stored_scales)
	pass # Replace with function body.
