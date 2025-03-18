extends Node3D


@export_enum("AcceleratedMotion", "CircularMotion", "MotionWithJerk") var motion_type: String = "AcceleratedMotion"

var motion_types: Dictionary = {
	"AcceleratedMotion": AcceleratedMotion,
	"CircularMotion": CircularMotion,
	"MotionWithJerk": MotionWithJerk
}

@onready var selected_type = motion_types[motion_type] as GDScript
