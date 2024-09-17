extends Node

var scale_count: int = 0
signal scale_count_changed(new_amount: int)
func _on_scale_removed():
	scale_count += scale_per_scale
	scale_count_changed.emit(scale_count)
	scales_scaled += 1
func increase_scale_count(amount: int):
	scale_count += amount
	scale_count_changed.emit(scale_count)

var money_count: int = 0
signal money_count_changed(new_amount: int)
func _on_fish_finished_fish():
	money_count += money_per_fish
	money_count_changed.emit(money_count)
	fish_scaled += 1
func increase_money_amount(amount: int):
	money_count += amount
	money_count_changed.emit(money_count)

var gem_count: int = 10000000000000
signal gem_count_changed(new_amount: int)
func increase_gem_amount(amount: int):
	#gem_count += amount
	gem_count_changed.emit(gem_count)


var strength: float = 1
var scale_per_scale: int = 1
var money_per_fish: int = 3
var max_fish:int = 10
var fish_time: int = 600

var scales_scaled: int = 0
var fish_scaled: int = 0

var strength_scale_level: int = 1
var strength_money_level: int = 1
var scale_per_fish_scale_level: int = 1
var scale_per_fish_money_level: int = 1
var money_per_fish_scale_level: int = 1
var money_per_fish_money_level: int = 1
var max_fish_money_level: int = 1
var max_fish_gem_level: int = 1
var fish_time_money_level: int = 1
var fish_time_gem_level: int =  1

var is_auto_scaler_enabled: bool
var auto_scaler_storage: int = 10
var auto_scaler_speed: float = .6 # seconds per scale

var auto_scaler_storage_money_level: int = 0
var auto_scaler_storage_gem_level: int = 0
var auto_scaler_speed_money_level: int = 0
var auto_scaler_speed_gem_level: int =  0
