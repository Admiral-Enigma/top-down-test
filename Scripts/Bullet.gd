extends RigidBody2D

var damage = 1

func _on_Bullet_body_entered( body ):
	print('HIT')
	if body.has_method("hit_by_bullet"):
		body.call("hit_by_bullet", damage)
		queue_free()
	else:
		queue_free()


func _on_Timer_timeout():
	queue_free()


