extends KinematicBody2D

export var MOVEMENT_SPEED = 140
var sprite
func _ready():
	sprite = $PlayerSprite
	set_physics_process(true)

func _physics_process(delta):
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