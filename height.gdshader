shader_type spatial;

uniform sampler2D heightmap;

/*
void vertex() {
	float h = texture(heightmap, UV).g;
	VERTEX = vec3(VERTEX.x, h, VERTEX.z);
	COLOR.rgb = vec3(h);
}*/

void fragment() {
	//NORMAL = normalize(cross(dFdx(VERTEX), dFdy(VERTEX)));
	//ALBEDO = vec3(COLOR.r);
	ALBEDO = vec3(texture(heightmap, UV).r);
}