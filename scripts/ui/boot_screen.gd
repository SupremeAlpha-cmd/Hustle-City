extends CanvasLayer
## Throwaway QA boot screen. Agy replaces this with the real frontend.
## Shows the title and the live 20:1 world clock.

@onready var _clock: Label = $Clock
@onready var _day: Label = $Day


func _process(_delta: float) -> void:
	var gm: Node = get_parent()
	if gm.has_method("time_string"):
		_clock.text = gm.time_string()
	if "day_count" in gm:
		_day.text = "Day %d — Benin City" % gm.day_count
