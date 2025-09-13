@tool
extends CollisionPolygon2D

@export var radius: float = 64.0 : set = _set_radius

func _ready():
	_update_polygon()

func _set_radius(value):
	radius = value
	_update_polygon()

func _update_polygon():
	var points = []
	for i in range(6):
		var angle = deg_to_rad(60 * i)
		points.append(Vector2(radius * cos(angle), radius * sin(angle)))
	polygon = points
