extends Polygon2D

onready var camera = $Viewport/Spatial/Camera
onready var terrain = $Viewport/Spatial/Terrain

func _ready():
	texture = $Viewport.get_texture()
	
	camera.look_at(terrain.translation, Vector3(0, 1, 0))

func set_heightmap(texture: Texture) -> void:
	terrain.get_surface_material(0).set_shader_param('heightmap', texture)
	
