extends Viewport

export var shader : Shader setget set_shader, get_shader

func _ready():
	# this feeds back the output of the shader to the shader itself
	$TextureRect.texture = self.get_texture()
	
func get_material() -> ShaderMaterial:
	return $TextureRect.material
	
func get_shader() -> Shader:
	return self.get_material().shader
	
func set_shader(s : Shader) -> void:
	shader = s
	self.get_material().set_shader(s)
	
func get_shader_param(param: String):
	return self.get_material().get_shader_param(param)
	
func set_shader_param(param: String, value) -> void:
	self.get_material().set_shader_param(param, value)
	
