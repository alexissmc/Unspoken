extends CanvasLayer

@onready var anim = $AnimationPlayer

# Para almacenar la posición del jugador
var player_position = Vector2.ZERO

# Precargar la escena del jugador
var player_scene = preload("res://Scenes/player.tscn")

func _ready():
	layer = -1  # Asegúrate de que la capa esté oculta al principio

func change_scene(path: String, new_position: Vector2) -> void:
	# Cambiar la capa para hacer visible la animación
	layer = 1
	
	# Reproducir la animación de salida
	anim.play("sala-pasillo")
	await anim.animation_finished  # Esperar a que termine la animación

	# Cambiar la escena
	get_tree().change_scene_to_file(path)

	# Reproducir la animación al revés (efecto de transición)
	anim.play_backwards("sala-pasillo")
	await anim.animation_finished  # Esperar a que termine la animación al revés

	# Ocultar la capa de transición
	layer = -1

	# Establecer la nueva posición del jugador después de cambiar de escena
	var current_scene = get_tree().current_scene
	if current_scene:
		# Instanciar el jugador de la escena precargada
		var player = player_scene.instantiate()
		player.position = new_position  # Establecer la nueva posición

		# Añadir el jugador a la nueva escena
		current_scene.add_child(player)


	
