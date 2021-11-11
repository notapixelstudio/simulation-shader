shader_type spatial;

uniform sampler2D heightmap;
uniform float exaggeration = 4.0;
uniform vec4 tint : hint_color;

void vertex() {
	float h = texture(heightmap, UV).g;
	VERTEX = vec3(VERTEX.x, h*exaggeration, VERTEX.z);
	COLOR.rgb = vec3(h);
}

void fragment() {
	float h = COLOR.y;
	float d = abs(h-0.5);
	NORMAL = normalize(cross(dFdx(VERTEX), dFdy(VERTEX)));
	float grid = max(step(mod(UV.x, 0.05)*20.0, d*0.05), step(mod(UV.y, 0.05)*20.0, d*0.05));
	ALBEDO = max(vec3(grid*d), h*tint.rgb);
	//ALBEDO = h*tint.rgb;
}