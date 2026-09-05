extends Control

@onready var pause_pillar_1 = $/root/Node2D/CanvasLayer/Control/PauseButton/PausePillar
@onready var pause_pillar_2 = $/root/Node2D/CanvasLayer/Control/PauseButton/PausePillar2
@onready var pause_icon_pillar = $/root/Node2D/CanvasLayer/Control/PauseButton/PauseIconPillar
func resume():
	get_tree().paused = false
	hide()	
	$AnimationPlayer.play_backwards("blur")
	pause_pillar_1.show()
	pause_pillar_2.show()
	pause_icon_pillar.hide()
	
func pause (): 
	get_tree().paused = true 
	show()
	$AnimationPlayer.play("blur")
	pause_pillar_1.hide()
	pause_pillar_2.hide()
	pause_icon_pillar.show()
	

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
	pause_icon_pillar.hide()

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
		pause_icon_pillar.hide()


	else: 
		pause() 
		pause_pillar_1.hide()
		pause_pillar_2.hide()
		pause_icon_pillar.show()


	
