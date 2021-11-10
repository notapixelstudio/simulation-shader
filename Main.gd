extends Control

func _ready():
	$OuterRect/Viewport/InnerRect.texture = $OuterRect/Viewport.get_texture()
	$OuterRect.texture = $OuterRect/Viewport.get_texture()
	
func _process(delta):
	$OuterRect/Viewport/InnerRect.material.set_shader_param("draw_pos", get_local_mouse_position())
