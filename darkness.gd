extends ColorRect

@export var player : CharacterBody2D

func _process(_delta):
	if player != null:
		var player_position_uv = player.global_position / Vector2(get_viewport().size)
		self.material.set_shader_parameter("player_position", player_position_uv)
