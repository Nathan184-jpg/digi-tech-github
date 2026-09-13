extends Node2D

var score: int =  0
var phase: int = 0
var max_enemies: int = 5
var current_enemies: int = 0 

@export var enemy_timer: Timer
@export var enemy_spawn: PathFollow2D
@export var enemy_scene: PackedScene
@export var fight_ui: Label
@export var anim: AnimationPlayer
@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.10).timeout
	new_fight() 
	AudioManager.play_boss_music()


func new_fight() -> void:
	player.can_move = false 
	player.can_move = true
	fight_ui.text = "FIGHT!"
	fight_ui.show()
	await get_tree().create_timer(0.50).timeout
	fight_ui.hide()
	anim.play("fight") 
	player.can_move = true 
	player.can_shoot = true 

	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		score +=1
		print(score)



func _start_fight(anim_name: StringName) -> void:
	if anim_name == "new_wave":
		current_enemies = 0
		max_enemies = max_enemies * 1.3
		print(max_enemies)
		await get_tree().create_timer(3.0).timeout


func spawn_enemy() -> void:
	pass;
