extends RigidBody2D

const ENGINE_FORCE = Vector2(0, -100000)
const BOOST_FORCE = Vector2(0, -50000)
const FIN_FORCE = 500000

@onready var plume = $MainEnginePlume
@onready var fuel = $Fuel
@onready var fuelDisplay = $"../Camera2D/FuelDisplay"

func _process(delta: float) -> void:
	fuelDisplay.text = "FUEL: %.2fs" % fuel.get_time_left()

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:				
	if Input.is_action_pressed("turn_left"):
		state.apply_torque(-FIN_FORCE)
	if Input.is_action_pressed("turn_right"):
		state.apply_torque(FIN_FORCE)
	if Input.is_action_pressed("cut_engine") or fuel.get_time_left() == 0:
		fuel.paused = true
		plume.emitting = false
	else:
		state.apply_central_force(ENGINE_FORCE.rotated(rotation))
		fuel.paused = false
		plume.emitting = true
	if Input.is_action_pressed("boost"):
		state.apply_central_force(BOOST_FORCE.rotated(rotation))
