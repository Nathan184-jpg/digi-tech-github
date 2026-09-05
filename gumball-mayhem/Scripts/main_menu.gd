extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_title_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _play() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/level.tscn")
	
	 
func _quit() -> void:
	get_tree().quit()


func _options() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/options.tscn")
