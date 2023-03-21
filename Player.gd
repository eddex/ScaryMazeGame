extends CharacterBody2D

signal game_start
signal game_over
signal level_complete

@export var started := false

const SPEED = 100.0

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	if started:
		self.velocity = self.global_position.direction_to(mouse_pos) * SPEED
		if self.global_position.distance_to(mouse_pos) > 10:
			var collision = move_and_collide(self.velocity * delta)
			if collision != null:
				var collider_name = collision.get_collider().name
				print(collider_name)
				if collider_name == "Walls":
					game_over.emit()
					started = false
				elif collider_name == "Chest":
					level_complete.emit()
	else:
		var collision = move_and_collide(Vector2(0,0))
		if collision != null:
			print(collision.get_collider().name)
			game_start.emit()
