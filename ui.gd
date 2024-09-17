extends Control

@onready var scale_count_display = $ColorRect/ScaleCountDisplay
@onready var money_count_display = $ColorRect/MoneyCountDisplay
@onready var audio_stream_player = $AudioStreamPlayer
var upgrades: Upgrades
var collectable_scale_menu: CollectableScaleMenu
var auto_scaler: AutoScaler
var settings_menu: SettingsMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	Stats.scale_count_changed.connect(_on_stats_scale_amount_changed)
	Stats.money_count_changed.connect(_on_stats_money_amount_changed)
	scale_count_display.text = str(Stats.scale_count)
	money_count_display.text = str(Stats.money_count)
	upgrades = get_tree().get_first_node_in_group("Upgrades")
	collectable_scale_menu = get_tree().get_first_node_in_group("CollectableScalesMenu")
	auto_scaler = get_tree().get_first_node_in_group("AutoScaler")
	settings_menu = get_tree().get_first_node_in_group("SettingsMenu")
	pass # Replace with function body.

func _on_stats_scale_amount_changed(new_amount: int):
	scale_count_display.text = str(new_amount)

func _on_stats_money_amount_changed(new_amount: int):
	money_count_display.text = str(new_amount)


func _on_stats_button_button_up():
	upgrades.visible = true
	audio_stream_player.play()
	pass # Replace with function body.


func _on_scales_button_button_up():
	collectable_scale_menu.visible = true
	audio_stream_player.play()

	pass # Replace with function body.


func _on_auto_scale_button_button_up():
	auto_scaler.visible = true
	audio_stream_player.play()
	pass # Replace with function body.


func _on_settings_button_button_up():
	settings_menu.visible = true
	audio_stream_player.play()
	pass # Replace with function body.
