extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true


var Door = false

@export var speed: float = 150.0

var start_position = Vector2.ZERO

@onready var sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

func _ready():

	if position == Vector2.ZERO:
		position = start_position

func set_start_position(new_position: Vector2):
	start_position = new_position
	position = new_position

func _physics_process(delta):
	
	Open_Door()
	

	var direction = Vector2.ZERO

	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	
	velocity = direction.normalized() * speed
	move_and_slide()

	
	if direction != Vector2.ZERO:
		if direction.x > 0:
			sprite.play("walk_right")
		elif direction.x < 0:
			sprite.play("walk_left")
		elif direction.y > 0:
			sprite.play("walk_down")
		elif direction.y < 0:
			sprite.play("walk_up")
	else:
		
		if sprite != null:
			sprite.stop()
			
	enemy_attack()	
	
func Open_Door():
	if Door == true:
		set_physics_process(false)
		Door = false

func player():
	pass


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()

		print(health);

func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
