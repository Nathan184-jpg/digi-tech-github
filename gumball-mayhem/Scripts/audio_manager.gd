extends Node

@onready var title_player: AudioStreamPlayer = $TitlePlayer 
@onready var boss_player: AudioStreamPlayer = $BossPlayer	
@onready var defeat_player: AudioStreamPlayer = $DefeatPlayer  
@onready var victory_player: AudioStreamPlayer = $VictoryPlayer
  

func play_title_music() -> void: 
	_stop_all()
	title_player.play()
	
func play_boss_music() -> void: 
	_stop_all()
	boss_player.play()
	
func play_defeat_music() -> void: 
	_stop_all()
	defeat_player.play()
	
func play_victory_music() -> void: 
	_stop_all() 
	victory_player.play() 
	
	
func _stop_all() -> void: 
	title_player.stop()
	boss_player.stop()
	defeat_player.stop()
	victory_player.stop()
	
	
	
	
	
