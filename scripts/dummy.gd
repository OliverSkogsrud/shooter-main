extends CharacterBody3D

var health = 20

@onready var ray = $RayCast3D
@onready var barrel = $enemy_for_shooter/Armature/Skeleton3D/BoneAttachment3D/EnemyGun
@onready var shootParticles = $enemy_for_shooter/Armature/Skeleton3D/BoneAttachment3D/EnemyGun/GPUParticles3D



var instance

var bullet = load("res://Scenes/enemy_bullet.tscn")


var blood_splash_pre = load("res://Scenes/blood_splash.tscn")
var splat_stain_pre = load("res://Scenes/splat_stain.tscn")

var loop = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):
	
	if loop == true:
		
		
		loop = false
		
		look_at(get_parent_node_3d().get_parent_node_3d().get_node("Player").global_position)
		
		if ray.is_colliding():
			var collider = ray.get_collider()
			if collider.is_in_group("Player"):
				shootParticles.emitting = true
				instance = bullet.instantiate()
				instance.position = barrel.global_position
				instance.transform.basis = barrel.global_transform.basis
				get_parent().add_child(instance)
		
		
		await get_tree().create_timer(0.2).timeout
		
		loop = true
		
			
	
	
	move_and_slide()


