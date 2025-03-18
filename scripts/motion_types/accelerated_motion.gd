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
	# путь вычисляется посредством поиска момента времени, в которой скорость меняет знак,
	# и сложения абсолютных значений площадей под графиком скорости.
	# выполняется для каждой оси координат
	var area: float = 0 
	
	var area_x: float = 0
	var t_0_x: float = (-initial_velocity.x) / acceleration.x	# момент времени, в который скорость равна 0
	if acceleration.x == 0:
		area_x = initial_velocity.x * t
	else:
		var t_interval1 = clampf(t, 0, t_0_x) 
		var t_interval2 = clampf(t, t_0_x, t) 
		var area_before_x = abs(_coordinate(t_interval1).x - _coordinate(0).x)
		var area_after_x = abs(_coordinate(t_interval2).x - _coordinate(t_0_x).x)
		area_x = area_before_x + area_after_x
	
	var area_y: float = 0
	var t_0_y: float = (-initial_velocity.y) / acceleration.y	# момент времени, в который скорость равна 0
	if acceleration.y == 0:
		area_y = initial_velocity.y * t
	else:
		var t_interval1 = clampf(t, 0, t_0_y) 
		var t_interval2 = clampf(t, t_0_y, t) 
		var area_before_y = abs(_coordinate(t_interval1).y - _coordinate(0).y)
		var area_after_y = abs(_coordinate(t_interval2).y - _coordinate(t_0_y).y)
		area_y = area_before_y + area_after_y
	
	var area_z: float = 0
	var t_0_z: float = (-initial_velocity.z) / acceleration.z	# момент времени, в который скорость равна 0
	if acceleration.z == 0:
		area_z = initial_velocity.z * t
	else:
		var t_interval1 = clampf(t, 0, t_0_z) 
		var t_interval2 = clampf(t, t_0_z, t) 
		var area_before_z = abs(_coordinate(t_interval1).z - _coordinate(0).z)
		var area_after_z = abs(_coordinate(t_interval2).z - _coordinate(t_0_z).z)
		area_z = area_before_z + area_after_z
	
	return sqrt(area_x**2 + area_y**2 + area_z**2)
