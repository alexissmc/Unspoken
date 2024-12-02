extends CharacterBody2D
var speed = 15
var player_chase = false
var player = null


func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position) / speed
		
		#$AnimatedSprite2D.play("left")
		#if(player.position.x - position.x) < 0:
			#$AnimatedSprite2D.flip_h = true
		#else:
			#$AnimatedSprite2D.flip_h = false
		if abs(player.position.x - position.x) > abs(player.position.y - position.y):
			if player.position.x > position.x:
				$AnimatedSprite2D.play("right")
			else:
				$AnimatedSprite2D.play("left")
		else:
			if player.position.y > position.y:
				$AnimatedSprite2D.play("down")
			else:
				$AnimatedSprite2D.play("up")

	else:
		$AnimatedSprite2D.play("down")




func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
