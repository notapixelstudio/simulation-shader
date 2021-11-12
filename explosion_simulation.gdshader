shader_type canvas_item;

uniform float width = 200.0;
uniform float height = 200.0;

uniform float blur = 0.5;

uniform vec2 explosion_center = vec2(0.0,0.0);
uniform float explosion_radius = 200.0;
uniform bool explosion = false;
uniform float explosion_frequency = 0.2;
uniform float explosion_decay = 0.1;
uniform float sea_level = 0.5;

const float TAU = 6.283185307;

void fragment(){
	vec2 normalized_explosion_center = vec2(explosion_center.x/width, explosion_center.y/height);
	vec4 f = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur);
	COLOR = sea_level - 0.94*(sea_level-f);
	if(explosion) {
		float d = distance(UV, normalized_explosion_center)*explosion_radius;
		vec2 delta = UV-normalized_explosion_center;
		vec3 new = vec3(delta.x/exp(d*explosion_decay), -sin(d*explosion_frequency)/exp(d*explosion_decay), delta.y/exp(d*explosion_decay));
		COLOR = clamp(COLOR + vec4(new,1.0), 0.0, 1.0);
	}
}