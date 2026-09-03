extends Control

func resume():
	get_tree().paused = false
	hide()	
	$AnimationPlayer.play_backwards("blur")
	
func pause (): 
	get_tree().paused = true 
	show()
	
	$AnimationPlayer.play("blur")

func esc(): 
	if Input.is_action_just_pressed("esc") and get_tree().paused == false: 
		pause()
		
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true: 
		resume()

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	esc()


func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	
	get_tree().reload_current_scene()
	print("yea")
func _on_quit_pressed() -> void:
	get_tree().quit()
