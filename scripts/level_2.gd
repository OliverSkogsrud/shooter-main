extends Node3D

@onready var player = $Player

func _physics_process(delta):
	get_tree().call_group("Enemy", "navigate", player.global_transform.origin)
