extends RigidBody2D

const BALANCE_FORCE = Vector2(-50, -9807)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_central_force(BALANCE_FORCE.rotated(rotation))
