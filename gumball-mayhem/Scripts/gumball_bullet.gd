extends Area2D

var speed: float = 500 

# Called when the node enters the scene tree for the first time.

func _process(delta: float) -> void:
	move_local_x(speed * delta)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			body.take_damage()
			queue_free()
