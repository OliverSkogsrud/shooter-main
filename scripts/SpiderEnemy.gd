extends CharacterBody3D


const SPEED = 0.05
const JUMP_VELOCITY = 4.5

@onready var ray = $goofyAhhMonster/Armature/Skeleton3D/BoneAttachment3D/RayCast3D

var isSeeingPlayer = false
@onready var nav_agent = $NavigationAgent3D
@onready var animation_player = $goofyAhhMonster/AnimationPlayer

func navigate(target_location):
	nav_agent.set_target_location(target_location)
	


func animate():
	if isSeeingPlayer == true:
		animation_player.play("Run")
	else:
		animation_player.play("Idle")

func _physics_process(delta):
	animate()
	
	var current_location = global_transform.origin
	
	
	var look_dir = -transform.basis.z
	if isSeeingPlayer:
		velocity = SPEED * look_dir
	
	if not is_on_floor():
		velocity.y -= 1.5
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.has_method("damage"):
			isSeeingPlayer = true
	else : isSeeingPlayer = false
	
	move_and_slide()
	
func _process(delta):
	look_at(get_parent().get_node("Player").global_position)
	await get_tree().create_timer(0.4).timeout
