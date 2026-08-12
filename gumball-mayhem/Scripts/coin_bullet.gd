extends Area2D

var direction: int = -1
var distance = 150
var time = 2.0
var horizontal_velocity = distance / time
var coin_gravity = 500
var velocity: Vector2 
const speed = 400


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.y = -100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.x = horizontal_velocity * direction 
	velocity.y = velocity.y + coin_gravity
	position = position + velocity 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			body.take_damage()
			queue_free()
