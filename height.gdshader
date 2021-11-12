shader_type spatial;

uniform sampler2D heightmap;
uniform float vertical_exaggeration = 4.0;
uniform float planar_exaggeration = 16.0;
uniform vec4 tint : hint_color;
uniform vec4 grid_tint : hint_color;
uniform int divisions = 40;

void vertex() {
	vec4 h = texture(heightmap, UV);
	VERTEX = vec3(VERTEX.x+(h.x-0.5)*planar_exaggeration, VERTEX.y+h.y*vertical_exaggeration, VERTEX.z+(h.z-0.5)*planar_exaggeration);
	COLOR.rgb = h.xyz;
}

void fragment() {
	float h = COLOR.y;
	float d = abs(h-0.5);
	NORMAL = normalize(cross(dFdx(VERTEX), dFdy(VERTEX)));
	float grid = 10.0*d*d*d*(step(mod(UV.x, 1.0/float(divisions))*float(divisions), 0.03) + step(mod(UV.y, 1.0/float(divisions))*float(divisions), 0.03));
	ALBEDO = mix(min(2.0*vec3(grid), grid_tint.rgb), tint.rgb, h);
	//ALBEDO = (2.0*h)*tint.rgb;
}