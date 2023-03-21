extends Node2D

var level = 1

func _ready():
	$Darkness.visible = true


func _on_player_input_event(viewport, event, shape_idx):
	print("collision?")


func _on_player_game_over():
	print("game over")
	$Player.set_collision_mask_value(level, false)
	level = 1
	$Player.set_collision_mask_value(level, true)
	$Player.global_position = $Level1/Start.global_position
	$Player.started = false
	$Level1.visible = true
	$Level1/Chest/CollisionShape2D.disabled = false
	$Mouse/CollisionShape2D.disabled = false
	$Level2.visible = false
	$Level2/Chest/CollisionShape2D.disabled = true
	$Level3.visible = false
	$Level3/Chest/CollisionShape2D.disabled = true
	$Level4.visible = false
	$Level4/Chest/CollisionShape2D.disabled = true
	

func _on_player_game_start():
	print("game started")
	$Mouse/CollisionShape2D.disabled = true
	$Player.started = true
	$Level1/Chest/CollisionShape2D.disabled = false


func _on_player_level_complete():
	$Player.set_collision_mask_value(level, false)
	print($Player.get_collision_mask_value(level))
	level += 1
	$Player.set_collision_mask_value(level, true)
	print($Player.get_collision_mask_value(level))
	match level:
		2:
			print("level 2")
			$Level1.visible = false
			$Level1/Chest/CollisionShape2D.disabled = true
			$Level2.visible = true
			$Level2/Chest/CollisionShape2D.disabled = false
		3:
			print("level 3")
			$Level2.visible = false
			$Level2/Chest/CollisionShape2D.disabled = true
			$Level3.visible = true
			$Level3/Chest/CollisionShape2D.disabled = false
		4:
			print("win")
			$Level3.visible = false
			$Level3/Chest/CollisionShape2D.disabled = true
			$Level4.visible = true
			$Level4/Chest/CollisionShape2D.disabled = false
		5:
			_on_player_game_over()
