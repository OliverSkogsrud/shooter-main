extends Node3D

@onready var play : Button = $mainUi/Control/VBoxContainer/play
@onready var options_button : Button = $mainUi/Control/VBoxContainer/options
@onready var exit : Button = $mainUi/Control/VBoxContainer/exit

@onready var main_ui : CanvasLayer = $mainUi

@onready var options : CanvasLayer = $Options

@onready var anti_aliasing_text : Label = $Options/Control/VBoxContainer/Anti_aliasing_text

var anti_aliasing_value = 100

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	

func _ready():
	anti_aliasing_text.text = "Anti-Aliasing: 8x"

func _on_options_pressed():
	main_ui.visible = false
	options.visible = true
	


func _on_exit_pressed():
	get_tree().quit()


func _on_h_slider_value_changed(value):
	print(value)
	if value == 25:
		anti_aliasing_text.text = "Anti-Aliasing: Disabled"
		ProjectSettings.set_setting("Rendering/Anti Aliasing/Quality/MSAA 3D", 1)
		ProjectSettings.save()

	if value == 50:
		anti_aliasing_text.text = "Anti-Aliasing: 2x"
		ProjectSettings.set_setting("Rendering/Anti Aliasing/Quality/MSAA 3D", 2)
		ProjectSettings.save()
	if value == 75:
		anti_aliasing_text.text = "Anti-Aliasing: 4x"
		ProjectSettings.set_setting("Rendering/Anti Aliasing/Quality/MSAA 3D", 3)
		ProjectSettings.save()
	if value == 100:
		anti_aliasing_text.text = "Anti-Aliasing: 8x"
		ProjectSettings.set_setting("Rendering/Anti Aliasing/Quality/MSAA 3D", 4)
		ProjectSettings.save()
		


func _on_back_pressed():
	main_ui.visible = true
	options.visible = false
