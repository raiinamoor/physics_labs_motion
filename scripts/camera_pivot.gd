extends Node3D


const ROTATION_ORT = Vector3(0, 0, 0)
const ROTATION_PERSP = Vector3(-45, 45, 0)
const ROTATION_DURATION = 0.5

@onready var camera: Camera3D = $Camera3D


func toggle_perspective(is_orthogonal: bool) -> void:
	if is_orthogonal:
		make_orthogonal()
	else:
		make_perspective()


func make_orthogonal() -> void:
	camera.projection = Camera3D.ProjectionType.PROJECTION_ORTHOGONAL
	
	var rotation_tween: Tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	rotation_tween.tween_property(self, "rotation", ROTATION_ORT, ROTATION_DURATION)


func make_perspective() -> void:
	camera.projection = Camera3D.ProjectionType.PROJECTION_PERSPECTIVE
	
	var rotation_tween: Tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	rotation_tween.tween_property(self, "rotation:y", lerp_angle(rotation.y, deg_to_rad(ROTATION_PERSP.y), 1), ROTATION_DURATION)
	rotation_tween.tween_property(self, "rotation:x", lerp_angle(rotation.x, deg_to_rad(ROTATION_PERSP.x), 1), ROTATION_DURATION)
	rotation_tween.tween_property(self, "rotation:z", lerp_angle(rotation.z, deg_to_rad(ROTATION_PERSP.z), 1), ROTATION_DURATION)


func _on_z_value_changed(value: float) -> void:
	toggle_perspective(value == 0)
