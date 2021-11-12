shader_type spatial;

uniform sampler2D heightmap;
uniform float vertical_exaggeration = 4.0;
uniform float planar_exaggeration = 8.0;
uniform vec4 tint : hint_color;

void vertex() {
	vec4 h = texture(heightmap, UV);
	VERTEX = vec3(VERTEX.x+h.x*planar_exaggeration, VERTEX.y+h.y*vertical_exaggeration, VERTEX.z+h.z*planar_exaggeration);
	COLOR.rgb = h.xyz;
}

void fragment() {
	float h = COLOR.y;
	float d = abs(h-0.5);
	NORMAL = normalize(cross(dFdx(VERTEX), dFdy(VERTEX)));
	float grid = max(step(mod(UV.x, 0.05)*20.0, 0.05), step(mod(UV.y, 0.05)*20.0, 0.05));
	ALBEDO = max(h*tint.rgb, vec3(grid));
	//ALBEDO = h*tint.rgb;
}