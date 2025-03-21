extends Panel


signal simulation_started(motion: Motion)
signal simulation_stopped
signal simulation_paused(is_paused: bool)
signal timer_updated(wait_time: float)

const BUTTON_START_TEXT = "Начать"
const BUTTON_STOP_TEXT = "Прервать"

@export var inputs: Dictionary[StringName, NodePath]
@export var delay_input: SpinBox

@onready var time_input: SpinBox = $MarginContainer/VBoxContainer/TimeParameter/HBoxContainer/Time
@onready var start_button: Button = $MarginContainer/StartButton


func toggle_simulation(turned_on: bool) -> void:
	if turned_on:
		var new_state: Motion = get_motion_from_inputs()
		start_button.text = BUTTON_STOP_TEXT
		
		simulation_started.emit(new_state)
		var delay = 0
		if delay_input:
			delay = delay_input.value
		timer_updated.emit(time_input.value, delay)
	else:
		start_button.text = BUTTON_START_TEXT
		
		simulation_stopped.emit()


func pause_simulation(is_paused: bool):
	simulation_paused.emit(is_paused)


func get_motion_from_inputs() -> Motion:
	var motion = owner.selected_type.new()
	for property_key: String in inputs:
		var node_path = inputs[property_key]
		var input: SpinBox = get_node(node_path)
		motion.set_indexed(property_key, input.value)
	
	return motion
