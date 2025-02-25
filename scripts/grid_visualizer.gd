extends Node3D


@export var material: ShaderMaterial
@export var target: Node3D


func _process(_delta: float) -> void:
	material.set_shader_parameter("target_position", target.global_position)
	global_position = target.global_position.round()
	
	for mesh_node: MeshInstance3D in get_tree().get_nodes_in_group("number_meshes"):
		mesh_node.mesh.text = str(mesh_node.global_position.round())
