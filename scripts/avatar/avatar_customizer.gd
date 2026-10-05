extends Node
class_name AvatarCustomizer
## Premium 3D avatars. Slider-based face sculpting, modular parts.
## One rig; hair/clothes/accessories slot in. Avatars must not look 2D.
## Two quality tiers: full (web/desktop), reduced (mobile) — same avatar.

signal avatar_changed

var face_params: Dictionary = {
	"jaw": 0.5, "nose": 0.5, "eyes": 0.5, "lips": 0.5,
	"skin_tone": 0.5, "cheek": 0.5, "brow": 0.5,
}
var hair_id: String = "default"
var outfit_id: String = "default"


func set_face_param(param: String, value: float) -> void:
	if face_params.has(param):
		face_params[param] = clampf(value, 0.0, 1.0)
		_apply_to_rig()
		avatar_changed.emit()


func _apply_to_rig() -> void:
	## Blend-shape weights get pushed to the rig here (agy: frontend).
	pass
