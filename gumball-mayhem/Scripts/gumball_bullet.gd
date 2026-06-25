extends Area2D

var speed: float = 500 
var direction: int = -1

#@export var = $Sprite2d etc..
# Called when the node enters the scene tree for the first time.
var gumball_colours = ["res://Assets/bluegumball.png", "res://Assets/greengumball.png","res://Assets/orangegumball.png","res://Assets/pinkgumball.png","res://Assets/redgumball.png", "res://Assets/purplegumball.png", "res://Assets/yellowgumball.png"]

func _ready() -> void:
	$Sprite2D.texture = load(gumball_colours[randi_range(0, len(gumball_colours) - 1)])
#change $sprite2D

func _process(delta: float) -> void:
	move_local_x(speed * direction * delta)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			body.take_damage()
			queue_free()
