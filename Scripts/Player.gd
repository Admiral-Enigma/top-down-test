extends KinematicBody2D

export var MOVEMENT_SPEED = 200
const BULLET_VELOCITY = 700
var sprite
var shoot_time
const shoot_delay = 100

func _ready():
	sprite = $PlayerSprite
	set_physics_process(true)
	shoot_time = 0

func _physics_process(delta):
	shoot_time += 10
	var newVector = Vector2()
	if (Input.is_action_pressed("ui_up")):
		newVector.y += -1
	if (Input.is_action_pressed("ui_down")):
		newVector.y += 1
	if (Input.is_action_pressed("ui_left")):
		newVector.x += -1
		sprite.scale.x = 1
	if (Input.is_action_pressed("ui_right")):
		newVector.x += 1
		sprite.scale.x = -1
	newVector = newVector.normalized() * MOVEMENT_SPEED * delta
	move_and_collide(newVector)
	
	if Input.is_action_pressed("ui_attack") and shoot_time > shoot_delay:
		var bullet = preload("res://Objects/Bullet.tscn").instance()
		bullet.position = $PlayerSprite/GunOrigin.global_position
		bullet.linear_velocity = Vector2(-sprite.scale.x * BULLET_VELOCITY, 0)
		bullet.add_collision_exception_with(self)
		get_parent().add_child(bullet)
		shoot_time = 0
		