extends RigidBody2D

@export var THRUST: float = 10000

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_pressed("click"):
		var dir = (get_global_mouse_position() - global_position).normalized()
		state.apply_central_force(dir * THRUST)
		print(position)
