extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0



var double_jump: bool = true
var score: int = 0


@export var sprite: Node 
@export var label: Label

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor() and not double_jump:
		double_jump = true

	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or is_on_wall():
			velocity.y = JUMP_VELOCITY 
		elif double_jump:
			velocity.y = JUMP_VELOCITY
			double_jump = false  

			
	if Input.is_action_pressed("ui_down"): 
		position.y += 1 
		



	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.animation = "default"
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else: 
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
 
func _damage(body: Node2D) -> void:
	if body is CharacterBody2D: 
		get_tree().call_deferred("reload_current_scene")

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
