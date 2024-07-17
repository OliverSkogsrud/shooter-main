extends Node

@export var health = 20

var blood_splash_pre = load("res://Scenes/blood_splash.tscn")

var splat_stain_pre = load("res://Scenes/splat_stain.tscn")



func enemy_damage(dmg):
	health -= dmg
	
	if health <= 0:
		var blood_splash = blood_splash_pre.instantiate()
		blood_splash.global_position = get_parent().global_position
		
		var splat_stain = splat_stain_pre.instantiate()
		splat_stain.global_position = get_parent().global_position
		
		get_parent().get_parent().add_child(blood_splash)
		get_parent().get_parent().add_child(splat_stain)
		
		splat_stain.get_node("Timer").start()
		
		blood_splash.emitting = true
		
		$AudioStreamPlayer3D.play()
		
		await get_tree().create_timer(0.3).timeout
		
		get_parent().visible = false
		
		await get_tree().create_timer(0.8).timeout
		
		get_parent().queue_free()
		get_parent().get_parent().remove_child(get_parent())
