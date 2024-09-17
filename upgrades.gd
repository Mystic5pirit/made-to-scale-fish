class_name Upgrades
extends Control

const SCALE_GOLDEN = preload("res://scale_golden.png")
const SCALE_GREY = preload("res://scale_grey.png")

@onready var audio_stream_player = $AudioStreamPlayer

@onready var weight_scale_button = $ColorRect/TextureRect/Weight/WeightScaleButton
@onready var weight_money_button = $ColorRect/TextureRect/Weight/WeightMoneyButton
@onready var scale_fish_scale_button = $ColorRect/TextureRect/ScalePerFish/ScaleFishScaleButton
@onready var scale_fish_money_button = $ColorRect/TextureRect/ScalePerFish/ScaleFishMoneyButton
@onready var money_fish_scale_button = $ColorRect/TextureRect/MoneyPerFish/MoneyFishScaleButton
@onready var money_fish_money_button = $ColorRect/TextureRect/MoneyPerFish/MoneyFishMoneyButton
@onready var max_fish_money_button = $ColorRect/TextureRect/MaxStoredFish/MaxFishMoneyButton
@onready var max_fish_gem_button = $ColorRect/TextureRect/MaxStoredFish/MaxFishGemButton
@onready var fish_time_money_button = $ColorRect/TextureRect/FishTime/FishTimeMoneyButton
@onready var fish_time_gem_button = $ColorRect/TextureRect/FishTime/FishTimeGemButton

@onready var weight_level_display = $ColorRect/TextureRect/Weight/Text
@onready var spf_level_display = $ColorRect/TextureRect/ScalePerFish/Text
@onready var mpf_level_display = $ColorRect/TextureRect/MoneyPerFish/Text
@onready var max_fish_level_display = $ColorRect/TextureRect/MaxStoredFish/Text
@onready var fish_time_level_display = $ColorRect/TextureRect/FishTime/Text

@onready var weight_scale_price_display = $ColorRect/TextureRect/Weight/WeightScaleButton/Text
@onready var weight_money_price_display = $ColorRect/TextureRect/Weight/WeightMoneyButton/Text
@onready var spf_scale_price_display = $ColorRect/TextureRect/ScalePerFish/ScaleFishScaleButton/Text
@onready var spf_money_price_display = $ColorRect/TextureRect/ScalePerFish/ScaleFishMoneyButton/Text
@onready var mpf_scale_price_display = $ColorRect/TextureRect/MoneyPerFish/MoneyFishScaleButton/Text
@onready var mpf_money_price_display = $ColorRect/TextureRect/MoneyPerFish/MoneyFishMoneyButton/Text
@onready var max_fish_money_price_display = $ColorRect/TextureRect/MaxStoredFish/MaxFishMoneyButton/Text
@onready var max_fish_gem_price_display = $ColorRect/TextureRect/MaxStoredFish/MaxFishGemButton/Text
@onready var fish_time_money_price_display = $ColorRect/TextureRect/FishTime/FishTimeMoneyButton/Text
@onready var fish_time_gem_price_display = $ColorRect/TextureRect/FishTime/FishTimeGemButton/Text

var weight_scale_price: int
var weight_money_price: int
var spf_scale_price: int
var spf_money_price: int
var mpf_scale_price: int
var mpf_money_price: int
var max_fish_money_price: int
var max_fish_gem_price: int
var fish_time_money_price: int
var fish_time_gem_price: int

# Called when the node enters the scene tree for the first time.
func _ready():
	adjust_display()
	
func _on_visible_on_screen_notifier_2d_screen_entered():
	adjust_display()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_weight_scale_button_button_up():
	if Stats.scale_count >= weight_scale_price:
		Stats.increase_scale_count(-1 * weight_scale_price)
		Stats.strength += 1
		Stats.strength_scale_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_weight_money_button_button_up():
	if Stats.money_count >= weight_money_price:
		Stats.increase_money_amount(-1 * weight_money_price)
		Stats.strength += 2
		Stats.strength_money_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_scale_fish_scale_button_button_up():
	if Stats.scale_count >= spf_scale_price:
		Stats.increase_scale_count(-1 * spf_scale_price)
		Stats.scale_per_scale += 1
		Stats.scale_per_fish_scale_level += 1
		audio_stream_player.play()
		adjust_display()

	pass # Replace with function body.


func _on_scale_fish_money_button_button_up():
	if Stats.money_count >= spf_money_price:
		Stats.increase_money_amount(-1 * spf_money_price)
		Stats.scale_per_scale += 2
		Stats.scale_per_fish_money_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_money_fish_scale_button_button_up():
	if Stats.scale_count >= mpf_scale_price:
		Stats.increase_scale_count(-1 * mpf_scale_price)
		Stats.money_per_fish += 1
		Stats.money_per_fish_scale_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_money_fish_money_button_button_up():
	if Stats.money_count >= mpf_money_price:
		Stats.increase_money_amount(-1 * mpf_money_price)
		Stats.money_per_fish += 2
		Stats.money_per_fish_money_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_max_fish_money_button_button_up():
	if Stats.money_count >= max_fish_money_price:
		Stats.increase_money_amount(-1 * max_fish_money_price)
		Stats.max_fish += 1
		Stats.max_fish_money_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_max_fish_gem_button_button_up():
	if Stats.gem_count >= max_fish_gem_price:
		Stats.increase_gem_amount(-1 * max_fish_gem_price)
		Stats.max_fish += 2
		Stats.max_fish_gem_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_fish_time_money_button_button_up():
	if Stats.money_count >= fish_time_money_price:
		Stats.increase_money_amount(-1 * fish_time_money_price)
		Stats.fish_time -= 1
		if Stats.fish_time < 1:
			Stats.fish_time = 1
		Stats.fish_time_money_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_fish_time_gem_button_button_up():
	if Stats.gem_count >= fish_time_gem_price:
		Stats.increase_gem_amount(-1 * fish_time_gem_price)
		Stats.fish_time -= 5
		if Stats.fish_time < 1:
			Stats.fish_time = 1
		Stats.fish_time_gem_level += 1
		audio_stream_player.play()
		adjust_display()
	pass # Replace with function body.


func _on_back_button_button_up():
	visible = false

func adjust_display():
	weight_level_display.text = str(Stats.strength)
	spf_level_display.text = str(Stats.scale_per_scale)
	mpf_level_display.text = str(Stats.money_per_fish)
	max_fish_level_display.text = str(Stats.max_fish)
	fish_time_level_display.text = str(Stats.fish_time)
	
	weight_scale_price = Stats.strength_scale_level * 200
	weight_money_price = Stats.strength_money_level * 10
	spf_scale_price = Stats.scale_per_fish_scale_level * 500
	spf_money_price = Stats.scale_per_fish_money_level * 30
	mpf_scale_price = Stats.money_per_fish_scale_level * 500
	mpf_money_price = Stats.money_per_fish_money_level * 30
	max_fish_money_price = Stats.max_fish_money_level * 100
	max_fish_gem_price = Stats.max_fish_gem_level * 20
	fish_time_money_price = Stats.fish_time_money_level * 100
	fish_time_gem_price = Stats.fish_time_gem_level * 20
	
	weight_scale_price_display.text = str(weight_scale_price)
	weight_money_price_display.text = str(weight_money_price)
	spf_scale_price_display.text = str(spf_scale_price)
	spf_money_price_display.text = str(spf_money_price)
	mpf_scale_price_display.text = str(mpf_scale_price)
	mpf_money_price_display.text = str(mpf_money_price)
	max_fish_money_price_display.text = str(max_fish_money_price)
	max_fish_gem_price_display.text = str(max_fish_gem_price) 
	fish_time_money_price_display.text = str(fish_time_money_price)
	fish_time_gem_price_display.text = str(fish_time_gem_price)
	
	if Stats.scale_count >= weight_scale_price:
		weight_scale_button.texture_normal = SCALE_GOLDEN
	else:
		weight_scale_button.texture_normal = SCALE_GREY
	if Stats.money_count >= weight_money_price:
		weight_money_button.texture_normal = SCALE_GOLDEN
	else:
		weight_money_button.texture_normal = SCALE_GREY
	if Stats.scale_count >= spf_scale_price:
		scale_fish_scale_button.texture_normal = SCALE_GOLDEN
	else:
		scale_fish_scale_button.texture_normal = SCALE_GREY
	if Stats.money_count >= spf_money_price:
		scale_fish_money_button.texture_normal = SCALE_GOLDEN
	else:
		scale_fish_money_button.texture_normal = SCALE_GREY
	if Stats.scale_count >= mpf_scale_price:
		money_fish_scale_button.texture_normal = SCALE_GOLDEN
	else:
		money_fish_scale_button.texture_normal = SCALE_GREY
	if Stats.money_count >= mpf_money_price:
		money_fish_money_button.texture_normal = SCALE_GOLDEN
	else:
		money_fish_money_button.texture_normal = SCALE_GREY
	if Stats.money_count >= max_fish_money_price:
		max_fish_money_button.texture_normal = SCALE_GOLDEN
	else:
		max_fish_money_button.texture_normal = SCALE_GREY
	if Stats.gem_count >= max_fish_gem_price:
		max_fish_gem_button.texture_normal = SCALE_GOLDEN
	else:
		max_fish_gem_button.texture_normal = SCALE_GREY
	if Stats.money_count >= fish_time_money_price:
		fish_time_money_button.texture_normal = SCALE_GOLDEN
	else:
		fish_time_money_button.texture_normal = SCALE_GREY
	if Stats.gem_count >= fish_time_gem_price:
		fish_time_gem_button.texture_normal = SCALE_GOLDEN
	else:
		fish_time_gem_button.texture_normal = SCALE_GREY
