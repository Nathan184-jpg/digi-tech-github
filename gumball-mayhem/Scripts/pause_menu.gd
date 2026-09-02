extends Control

func resume():
	get_tree().paused = false
	
	$AnimationPlayer.play_backwards("blur")
func pause (): 
	get_tree().paused = true 
	
	$AnimationPlayer.play("blur")

func Escape(): 
	if Input.is_action_just_pressed("esc") and get_tree().paused == false: 
		pause()
		
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true: 
		resume()

func _ready() -> void:
	$AnimationPlayer.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Escape()


func _on_resume_pressed() -> void:
	resume()
	print("yep")

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()
