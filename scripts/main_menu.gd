extends Node3D

@onready var play : Button = $mainUi/Control/VBoxContainer/play
@onready var options_button : Button = $mainUi/Control/VBoxContainer/options
@onready var exit : Button = $mainUi/Control/VBoxContainer/exit

@onready var main_ui : CanvasLayer = $mainUi

@onready var options : CanvasLayer = $Options



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	

func _on_options_pressed():
	main_ui.visible = false
	options.visible = true
	


func _on_exit_pressed():
	get_tree().quit()
