extends Node2D

signal new_part(pos : Vector2, type : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("new"):
		new_part.emit(Vector2(1,1), "gun")
