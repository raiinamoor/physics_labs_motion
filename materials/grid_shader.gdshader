shader_type spatial;
render_mode unshaded;

uniform vec3 target_position;
uniform float max_distance = 2;
varying vec3 world_position;

void vertex() {
    world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	vec3 relative_pos = world_position - target_position;
	vec3 mapped_dist = relative_pos / max_distance;
	float dist = 1.0 - length(mapped_dist);
	float clamped_dist = clamp(dist, 0, 1);
	
	ALPHA = sqrt(clamped_dist);
	ALBEDO = vec3(mapped_dist);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
