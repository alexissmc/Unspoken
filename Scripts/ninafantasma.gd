extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var health = 200
var player_inattack_zone = false
var can_take_damage = true
var attack_cooldown = true  # Control del cooldown de ataque
var player_alive = true
func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position) / speed
		
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

	if player_inattack_zone:
		defeat_player()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func _on_enemyhitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = true

func _on_enemyhitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = false

func defeat_player():
	if player:
		print("El jugador ha sido derrotado.")
		player_alive = false  # Suponiendo que el jugador tiene una variable para esto
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")  # Cambia a la escena de Game Over

func _on_attack_cooldown_timer_timeout() -> void:
	attack_cooldown = true
