extends Control

onready var outer_rect = $OuterRect
onready var viewport = $OuterRect/Viewport
onready var inner_rect = $OuterRect/Viewport/InnerRect

func _ready():
	var size = outer_rect.rect_size
	viewport.size = size
	
	inner_rect.material.set_shader_param("width", size.x)
	inner_rect.material.set_shader_param("height", size.y)
	
	inner_rect.texture = viewport.get_texture()
	outer_rect.texture = viewport.get_texture()
	
func _process(delta):
	inner_rect.material.set_shader_param("explosion_center", get_local_mouse_position())

func _input(event):
	if event is InputEventMouseButton:
		inner_rect.material.set_shader_param("explosion", event.pressed)
