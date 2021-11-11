shader_type spatial;

uniform sampler2D heightmap;
uniform float exaggeration = 4.0;

void vertex() {
	float h = texture(heightmap, UV).g;
	VERTEX = vec3(VERTEX.x, h*exaggeration, VERTEX.z);
	COLOR.rgb = vec3(h);
}

void fragment() {
	NORMAL = normalize(cross(dFdx(VERTEX), dFdy(VERTEX)));
	ALBEDO = vec3(COLOR.r);
}