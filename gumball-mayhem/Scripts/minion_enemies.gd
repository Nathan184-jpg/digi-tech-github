extends CharacterBody2D
var health = 3
const SPEED = 50.0
var direction = -1

@export var speed = 300
@export var player: CharacterBody2D
@export var anim: AnimationPlayer
@export var enemy: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_on_floor(): 
		velocity += get_gravity() * delta 
		
	velocity.x = SPEED * direction

	move_and_slide()
	
func take_damage() -> void:
	if health > 1: 
		health -= 1

	else: 
		queue_free()
		
	enemy.modulate = Color.BLUE 
	await get_tree().create_timer(0.05).timeout 
	enemy.modulate = Color.WHITE


		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
