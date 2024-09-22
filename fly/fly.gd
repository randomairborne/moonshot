extends Node2D

const SPAWN_OFFSETS = 256
const SPAWN_CHANCE = 100
var spawnedPlaces = {}
@onready var planeScene = load("res://fly/Plane.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var rocket_position = ($Rocket).position
	var spawn_center = Vector2(round_spawn_offset(rocket_position.x), round_spawn_offset(rocket_position.y))
	for y in range(round_spawn_offset(spawn_center.y-screen_size.y), spawn_center.y + screen_size.y, SPAWN_OFFSETS):
		if y > 0 - SPAWN_OFFSETS:
			continue
		for x in range(round_spawn_offset(spawn_center.x-screen_size.x), spawn_center.x + screen_size.x, SPAWN_OFFSETS):
			var spawn_position = Vector2(x, y)
			if spawnedPlaces.has(spawn_position):
				continue
			spawnedPlaces[spawn_position] = true
			if randi_range(0, SPAWN_CHANCE) == 0:
				var new_plane = planeScene.instantiate()
				new_plane.name = "Plane %s" % spawn_position
				new_plane.position = spawn_position
				get_tree().root.add_child(new_plane)
				
	pass

func round_spawn_offset(number: float) -> float:
	return SPAWN_OFFSETS * round(number / SPAWN_OFFSETS)
