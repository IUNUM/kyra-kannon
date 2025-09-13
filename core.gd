extends RigidBody2D

@export var THRUST: float = 10000

var thrusting := false

func _physics_process(delta: float) -> void:
	thrusting = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	if thrusting:
		$Fire.visible = true
	else:
		$Fire.visible = false
	$Body.visible = true
	if thrusting:
		var dir = (get_global_mouse_position() - global_position).normalized()
		apply_central_force(dir * THRUST)
		$Fire.rotation_degrees = 150.9 + rad_to_deg(dir.angle()) + 90
		print(position)
