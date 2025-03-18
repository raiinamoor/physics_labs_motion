class_name CircularMotion
extends Motion


@export var radius: float = 0
@export var rotational_frequency: float = 0
# center position?


func _coordinate(t: float) -> Vector3:
	return Vector3(
		radius * cos(angle(t)),
		radius * sin(angle(t)),
		0
	)


func _linear_velocity(t: float) -> Vector3:
	# v = o * rd
	return Vector3(
		angular_velocity(t) * radius * -sin(angle(t)),
		angular_velocity(t) * radius * cos(angle(t)),
		0
	)


func _distance(t: float) -> float:
	return _linear_velocity(t).length() * t


func angular_velocity(t: float) -> float:
	return 2 * PI * rotational_frequency


func angle(t: float) -> float:
	return angular_velocity(t) * t


func angle_degrees(t: float) -> float:
	return fmod(angle(t) / PI * 180, 360)


func number_of_revolutions(t: float) -> float:
	return angle(t) / (2 * PI)
