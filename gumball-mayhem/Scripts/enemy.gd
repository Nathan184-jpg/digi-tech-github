extends CharacterBody2D

var health = 100 
var current_phase = 1
#var phase2_threshold = 1
var is_dead: bool = false 

@export var gumball_bullet_spawn: Marker2D
@export var coin_bullet_spawn: Marker2D
@export var minion_enemies_spawn: Marker2D
@export var gumball_bullet_scene: PackedScene 
@export var coin_bullet_scene: PackedScene
@export var minion_enemies: PackedScene
@export var bullet_timer: Timer 
@export var health_ui: ProgressBar
@export var anim: AnimationPlayer
@export var player: CharacterBody2D
@export var knockback_strength: float = 200.0  




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;
				
	if health <= 75 and current_phase == 1: 
		current_phase = 2  
		$AnimatedSprite2D.animation = ("Phases - glass crack")
		$AnimatedSprite2D.frame = 1
		$AnimatedSprite2D.pause()
		print ("Phase 2 Begin")
		
	if health <= 50 and current_phase == 2: 
		current_phase = 3 
		$AnimatedSprite2D.frame = 2
		$AnimatedSprite2D.pause()
		print ("Phase 3 Begin")
	if health <= 25 and current_phase == 3: 
		current_phase = 4 
		$AnimatedSprite2D.frame = 3
		$AnimatedSprite2D.pause()
		print ("Phase 4 Begin") 
	
func take_damage() -> void:
	if is_dead: 
		return 
	if health > 1: 
		health -= 1
		anim.play("hit")
	else:
		is_dead = true 
		health = 0 
		current_phase = 0
		set_process(false) 
		get_tree().call_group("minion_enemies", "queue_free") 

		$AnimatedSprite2D.play("Boss death")
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")
		
func _damage(body: Node2D) -> void:
	if body is CharacterBody2D: 
		get_tree().change_scene_to_file("res://Scenes/defeat.tscn")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("get_knockback"): 
		body.get_knockback(global_position, knockback_strength)
	
func _on_gumball_timer_timeout() -> void:
	if current_phase == 2  or current_phase == 4: 
		var bullet = gumball_bullet_scene.instantiate()
		bullet.direction = -1
		bullet.global_position = gumball_bullet_spawn.global_position 
		add_sibling(bullet)  
		
func _on_coin_bullet_timer_timeout() -> void:
	if current_phase == 1 or current_phase == 4: 
		#PLAY ANIMATION
		var bullet = coin_bullet_scene.instantiate() 
		bullet.player = player
		bullet.global_position = coin_bullet_spawn.global_position  
		add_sibling(bullet)  


func spawn_enemy() -> void: 
	if current_phase == 3  or current_phase == 4: 
		
		var enemy = minion_enemies.instantiate()
		get_parent().add_child(enemy)
		enemy.global_position = minion_enemies_spawn.global_position
