class_name SimulationTimer
extends Timer


var elapsed_time: float:
	get: return wait_time - time_left


func start_timer(t: float):
	start(t)


func pause(is_paused: bool):
	paused = is_paused


func reset() -> void:
	#start(0)
	stop()
