extends CharacterBody2D

const SPEED = 50.0
var direction = -1
@export var speed = 300
@export var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_on_floor(): 
		velocity += get_gravity() * delta 
		
	velocity.x = SPEED * direction

	move_and_slide()





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
