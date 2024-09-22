extends Camera2D
class_name CustomCamera2D

# Target node the camera is following
@export var target_node: Node2D = null

func _process(_delta) -> void:
	var target_pos = target_node.get_position()
	set_position(target_pos)
