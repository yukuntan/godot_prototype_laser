extends Node2D

export var Length = 1280

onready var body = $Body
onready var hit = $Hit

func _ready():
	raycast()

func _physics_process(delta):
	raycast()

func _on_Cold_timeout():
	set_physics_process(true)

func raycast():
	var dest = Vector2(Length, 0)
	hit.set_cast_to(dest)
	if hit.is_colliding():
		dest = body.to_local(hit.get_collision_point())
	body.set_point_position(1, dest)

func cold():
	$Cold.start()
	set_physics_process(false)