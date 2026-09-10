extends Control

@onready var pause_pillar_1 = $/root/Node2D/CanvasLayer/Control/PauseButton/PausePillar
@onready var pause_pillar_2 = $/root/Node2D/CanvasLayer/Control/PauseButton/PausePillar2
@onready var pause_icon = $/root/Node2D/CanvasLayer/Control/PauseButton/PauseIcon

func resume():
	get_tree().paused = false
	hide()	
	$AnimationPlayer.play_backwards("blur")
	pause_pillar_1.show()
	pause_pillar_2.show()
	pause_icon.hide()
	
func pause (): 
	get_tree().paused = true 
	show()
	$AnimationPlayer.play("blur")
	pause_pillar_1.hide()
	pause_pillar_2.hide()
	pause_icon.show()
	

func esc(): 
	if Input.is_action_just_pressed("esc") and get_tree().paused == false: 
		pause()
		
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true: 
		resume()

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()
	pause_pillar_1.show()
	pause_pillar_2.show()
	pause_icon.hide()
	pause_pillar_1.modulate = Color("00D4DB")
	pause_pillar_2.modulate = Color("00D4DB")
	pause_icon.modulate = Color("00D4DB")


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


func _on_button_pressed() -> void:
	if get_tree().paused: 
		resume() 
		pause_pillar_1.show()
		pause_pillar_2.show()
		pause_icon.hide()


	else: 
		pause() 
		pause_pillar_1.hide()
		pause_pillar_2.hide()
		pause_icon.show()



func _on_pause_button_mouse_entered() -> void:
	pause_pillar_1.modulate = Color("B2F8FA")
	pause_pillar_2.modulate = Color("B2F8FA")
	pause_icon.modulate = Color("B2F8FA")
	
func _on_pause_button_mouse_exited() -> void:
	pause_pillar_1.modulate = Color("00D4DB")
	pause_pillar_2.modulate = Color("00D4DB")
	pause_icon.modulate = Color("00D4DB")


func _on_return_to_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
