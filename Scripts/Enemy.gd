extends KinematicBody2D

var speed = 150
const SMOOTH = 5
var hp = 5
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = $View.get_overlapping_bodies()
	var newMovement = Vector2()
	
	if bodies.size() > 0:
		for body in bodies:
			if body.is_in_group("Player"):
				# Follow HIM!
				if body.position.x < self.position.x:
					newMovement.x += -1
				if body.position.x > self.position.x + SMOOTH:
					newMovement.x += 1
				if body.position.y < self.position.y + SMOOTH:
					newMovement.y += -1
				if body.position.y > self.position.y:
					newMovement.y += 1
	newMovement = newMovement.normalized() * speed * delta
	move_and_collide(newMovement)
func hit_by_bullet(damage):
	hp -= damage
	if !hp > 0:
		#Play death sound
		queue_free()