extends Node2D

@export var radius: float = 64.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func add_part(pos: Vector2, type: String) -> void:
	match (type):
		"gun":
			gun_part(pos)


func _on_new_part(pos: Vector2, type: String) -> void:
	add_part(pos, type)

func gun_part(pos: Vector2) -> void:
	var gun = RigidBody2D.new()
	gun.name = "Gun{0}".format(pos)
	print(gun.name)
	var body = AnimatedSprite2D.new()
	body.name = "body"
	var frames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.add_frame("idle", load("images/Ship parts/gun.png"))
	body.sprite_frames = frames
	body.scale = Vector2(0.5, 0.5)
	gun.add_child(body)
	var collision = CollisionPolygon2D.new()
	var points = []
	for i in range(6):
		var angle = deg_to_rad(60 * i)
		points.append(Vector2(radius * cos(angle), radius * sin(angle)))
	collision.polygon = points
	gun.add_child(collision)
	add_child(gun)
