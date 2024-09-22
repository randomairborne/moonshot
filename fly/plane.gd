extends RigidBody2D

const FLIGHT_FORCE = Vector2(-50, -9807)
const BALANCE_FORCE = 500

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_central_force(FLIGHT_FORCE.rotated(rotation))
	if rotation > 0:
		state.apply_torque(-BALANCE_FORCE)
	elif rotation < 0:
		state.apply_torque(BALANCE_FORCE)
