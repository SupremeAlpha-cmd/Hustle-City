extends Node
## Hustle City — game root.
## Owns the world clock (20:1) and wires the core systems together.

const TIME_RATIO: float = 20.0 ## game-minutes per real minute. One game day = 72 real minutes.
const MINUTES_PER_DAY: float = 24.0 * 60.0

var game_minutes: float = 8.0 * 60.0 ## world clock; day one starts at 08:00
var day_count: int = 1

signal time_changed(game_minutes: float)
signal new_day(day_count: int)


func _ready() -> void:
	print("[Hustle City] Booting — Benin City awaits.")


func _process(delta: float) -> void:
	game_minutes += delta * TIME_RATIO
	if game_minutes >= MINUTES_PER_DAY:
		game_minutes -= MINUTES_PER_DAY
		day_count += 1
		new_day.emit(day_count)
	time_changed.emit(game_minutes)


func time_string() -> String:
	var h: int = int(game_minutes) / 60
	var m: int = int(game_minutes) % 60
	return "%02d:%02d" % [h, m]


func is_night() -> bool:
	var h: int = int(game_minutes) / 60
	return h < 6 or h >= 19
