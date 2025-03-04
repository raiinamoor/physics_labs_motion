class_name AcceleratedMotion
extends Motion


@export var initial_coord: Vector3 = Vector3.ZERO
@export var acceleration: Vector3 = Vector3.ZERO
@export var initial_velocity: Vector3 = Vector3.ZERO
var accumulated_distance: float = 0


func _coordinate(t: float) -> Vector3:
	return initial_coord + initial_velocity * t + (acceleration * t ** 2) / 2


func _linear_velocity(t: float) -> Vector3:
	return initial_velocity + acceleration * t


func _distance(t: float) -> float:
	return accumulated_distance
#func _distance(t: float) -> float:
	#var displacement: Vector3 = initial_velocity * t + acceleration * t**2 / 2
	#return displacement.length()
