extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false

var current_dir = "none"

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
	enemy_attack()
	attack()
	
	if health <= 0:
		player_alive= false
		health = 0
		print("you are dead")
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
	

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
			current_dir = "walk_right"
			sprite.play("walk_right")
		elif direction.x < 0:
			current_dir = "walk_left"
			if attack_ip == false:
				sprite.play("walk_left")
		elif direction.y > 0:
			current_dir = "walk_left"
			if attack_ip == false:
				sprite.play("walk_down")
		elif direction.y < 0:
			current_dir = "walk_left"
			if attack_ip == false:
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
	
func attack():
	var dir = current_dir
	if Input.is_action_just_pressed("attack"):
		Global.player_current_attack = true
		attack_ip = true
		if dir == "walk_right":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("fight")
			$deal_attack_timer.start()
		if dir == "walk_left":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("fight")
			$deal_attack_timer.start()
		if dir == "walk_down":
			$AnimatedSprite2D.play("fight")
			$deal_attack_timer.start()
		if dir == "walk_up":
			$AnimatedSprite2D.play("fight")
			$deal_attack_timer.start()
			
			
			
			
		
	
	


func _on_deal_attack_timer_timeout() -> void:
	$deal_attack_timer.stop()
	Global.player_current_attack = false
	attack_ip = false
	
