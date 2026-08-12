extends CharacterBody2D

var health = 100 
var current_phase = 1

@export var gumball_bullet_spawn: Marker2D
@export var coin_bullet_spawn: Marker2D

@export var gumball_bullet_scene: PackedScene 
@export var coin_bullet_scene: PackedScene
@export var bullet_timer: Timer 
@export var health_ui: ProgressBar
@export var anim: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= 75 and current_phase == 1: 
		current_phase = 2  
		print ("Phase 2 Begin")
	if health <= 50 and current_phase == 2: 
		current_phase = 3 
		print ("Phase 3 Begin")
	if health <= 25 and current_phase == 3: 
		current_phase = 4 
		print ("Phase 4 Begin")

func take_damage() -> void:
	if health > 1: 
		health -= 1
		anim.play("hit")
	else:
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")
		
func _damage(body: Node2D) -> void:
	if body is CharacterBody2D: 
		get_tree().change_scene_to_file("res://Scenes/defeat.tscn")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
	
func _on_gumball_timer_timeout() -> void:
	var bullet = gumball_bullet_scene.instantiate()
	bullet.direction = -1
	bullet.global_position = gumball_bullet_spawn.global_position 
	add_sibling(bullet)  
		
func _on_coin_bullet_timer_timeout() -> void:
	var bullet = coin_bullet_scene.instantiate() 
	bullet.direction = -1
	bullet.global_position = coin_bullet_spawn.global_position  
	add_sibling(bullet)  
	
