extends CharacterBody2D

var Door = false

# Velocidad de movimiento
@export var speed: float = 200.0

# Referencia al AnimatedSprite2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	
	Open_Door()
	
	# Inicializar un vector de dirección para el movimiento
	var direction = Vector2.ZERO

	# Detectar la entrada del jugador y asignar la dirección
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Mover el personaje en la dirección indicada por la velocidad
	velocity = direction.normalized() * speed
	move_and_slide()

	# Cambiar la animación según la dirección
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
		# Detener la animación si no hay movimiento
		sprite.stop()
		
func Open_Door():
	if Door == true:
		set_physics_process(false)
		Door = false
