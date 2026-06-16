extends CharacterBody2D

var health = 4

@export var bullet_spawn: Marker2D
@export var bullet_scene: PackedScene 
@export var bullet_timer: Timer 
@export var health_ui: ProgressBar




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func take_damage() -> void:
	if health > 1: 
		health -= 1
		#health_ui.value = health
	
func _damage(body: Node2D) -> void:
	if body is CharacterBody2D: 
		get_tree().call_deferred("reload_current_scene") 
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			body.take_damage()
			queue_free()
	
func _on_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate() 
	bullet.direction = -1
	bullet.global_position = bullet_spawn.global_position 
	add_sibling(bullet) 
	
	
	

	
