class_name MotionComponent
extends Node


@export var timer: SimulationTimer
@export var target: Node3D # перемещаемое тело
@export var motion: Motion

@export var arrow: Node3D


func _process(_delta: float) -> void:
	var t: float = timer.elapsed_time_with_delay
	target.position = motion._coordinate(t)
	
	if arrow != null:
		var scale_value
		# check to avoid "det==0" error
		if motion._linear_velocity(t).length() > 0:
			var look_target = motion._coordinate(t) + motion._linear_velocity(t)
			# check to avoid "look_at() failed" error
			var up_vector = Vector3.RIGHT if look_target.angle_to(Vector3.UP) < 0.05 else Vector3.UP
			arrow.look_at(look_target, up_vector)
			scale_value = motion._linear_velocity(t).length()
		else:
			scale_value = 0.1
		arrow.scale.z = scale_value

func set_state(new_state: Motion):
	motion = new_state
