extends RigidBody2D

var player: CharacterBody2D
var target_position: Vector2
var vertical: float = 350
var speed: float = 190 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_position = global_position - player.global_position
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	var discriminant = vertical**2 - 2 * gravity * target_position.y
	var initial_horizontal_velocity = -target_position.x / ((-vertical - (discriminant**0.5))/-gravity)
	linear_velocity.y = -vertical
	linear_velocity.x = initial_horizontal_velocity
	#print(initial_horizontal_velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			body.take_damage()
			queue_free()
