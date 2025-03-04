extends Panel


@export var time_label: Label

@export var timer: Timer
@export var displayed_properties: Dictionary = {}

@export_enum("AcceleratedMotion", "CircularMotion") var motion_type: String = "AcceleratedMotion"

var motion_types: Dictionary = {
	"AcceleratedMotion": AcceleratedMotion,
	"CircularMotion": CircularMotion
}
#var motion:
	#get: return motion_types[motion_type] as GDScript
@onready var motion = (motion_types[motion_type] as GDScript).new()

func _process(delta: float) -> void:
	for key_label: NodePath in displayed_properties:
		var label: Label = get_node(key_label)
		var value_name = displayed_properties[key_label]
		var value = motion.call(value_name, timer.elapsed_time)
		label.text = "{v}".format({"v": value})
	
	time_label.text = "{t}".format({"t": timer.elapsed_time})


func set_state(state: Motion):
	motion = state
