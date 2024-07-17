extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var ray = $goofyAhhMonster/Armature/Skeleton3D/BoneAttachment3D/RayCast3D

var isSeeingPlayer = false

@onready var animation_player = $goofyAhhMonster/AnimationPlayer

func animate():
	if isSeeingPlayer == true:
		var look_dir = -transform.basis.z
		velocity = look_dir * SPEED
		animation_player.play("Run")
	else:
		animation_player.play("Idle")

func _physics_process(delta):
	animate()
	
	if not is_on_floor():
		velocity.y -= 1.5
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.has_method("damage"):
			isSeeingPlayer = true
	else : isSeeingPlayer = false
	
func _process(delta):
	look_at(-get_parent().get_node("Player").position)
	await get_tree().create_timer(0.2).timeout
