extends Node2D

var score: int =  0

@export var fight_ui: Label
@export var anim: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.10).timeout
	new_fight()


func new_fight() -> void:
	fight_ui.text = "FIGHT!"
	fight_ui.show()
	await get_tree().create_timer(0.50).timeout
	fight_ui.hide()
	anim.play("fight") 
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		score +=1
		print(score)



func _start_fight(anim_name: StringName) -> void:
	if anim_name == "fight":
		print("FIGHT!")
