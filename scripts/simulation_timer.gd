class_name SimulationTimer
extends Timer


var delay: float = 0

var elapsed_time: float:
	get: return wait_time - time_left
var elapsed_time_with_delay: float:
	get: return clamp(elapsed_time - delay, 0, elapsed_time)


func start_timer(t: float, _delay: float = 0):
	delay = _delay
	start(t)


func pause(is_paused: bool):
	paused = is_paused


func reset() -> void:
	#start(0)
	stop()
