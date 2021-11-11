extends Control

func _ready():
	# set the size of the simulation equal to the size of the TextureRect
	var size = $TextureRect.rect_size
	$Simulation.size = size
	
	# set width and height also for the example shader
	$Simulation.set_shader_param("width", size.x)
	$Simulation.set_shader_param("height", size.y)
	
	# render the simulation both in the TextureRect and the Sprite
	$TextureRect.texture = $Simulation.get_texture()
	$Sprite.texture = $Simulation.get_texture()
	
func _process(delta):
	# tell the mouse coordinates to the simulation shader
	$Simulation.set_shader_param("explosion_center", get_local_mouse_position())
	
	$ThreeDView.set_heightmap($Simulation.get_texture())

func _input(event):
	# set or reset the `explosion` parameter of the simulation shader according
	# to the state of mouse buttons
	if event is InputEventMouseButton:
		$Simulation.set_shader_param("explosion", event.pressed)
