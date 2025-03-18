extends Panel


@export var time_label: Label

@export var timer: Timer
@export var displayed_properties: Dictionary[NodePath, StringName] = {}

@onready var motion

func _ready() -> void:
	await owner.ready
	motion = owner.selected_type.new()


func _process(delta: float) -> void:
	for key_label: NodePath in displayed_properties:
		var label: Label = get_node(key_label)
		var value_name = displayed_properties[key_label]
		var value = motion.call(value_name, timer.elapsed_time_with_delay)
		label.text = "{v}".format({"v": value})
	
	time_label.text = "{t}".format({"t": timer.elapsed_time})


func set_state(state: Motion):
	motion = state
