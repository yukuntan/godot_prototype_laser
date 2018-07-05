extends KinematicBody2D

const SPEED = 150
const Laser = preload("res://scenes/laser.tscn")

var laser = null

func _physics_process(delta):
	var dir = Vector2(0, 0)
	
	if Input.is_action_pressed("left"):
		dir.x += -1
	if Input.is_action_pressed("right"):
		dir.x += 1
	if Input.is_action_pressed("up"):
		dir.y += -1
	if Input.is_action_pressed("down"):
		dir.y += 1
		
	look_at(get_global_mouse_position())
	move_and_collide(dir.normalized() * SPEED * delta)
	
	if Input.is_action_pressed("fire"):
		shoot()

func shoot():
	if null == laser:
		laser = Laser.instance()
		$gun.add_child(laser)
	
	if !laser.is_visible():
		laser.set_visible(true)
