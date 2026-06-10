extends Node2D

var score: int =  0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("FIGHT!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		score +=1
		print(score)
	
