extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var ray = $goofyAhhMonster/Armature/Skeleton3D/BoneAttachment3D/RayCast3D

var isSeeingPlayer = false

@onready var animTree : AnimationTree = $AnimationTree

func animate():
	if isSeeingPlayer == true:
		pass #Run
	else:
		pass #idle

func _physics_process(delta):
	animate()
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.has_method("damage"):
			isSeeingPlayer = true
	else : isSeeingPlayer = false
