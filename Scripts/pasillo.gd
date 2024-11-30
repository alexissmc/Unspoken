extends Node2D

# Usamos preload para cargar la escena
var change_scene = load("res://Scenes/sala.tscn")

func _on_salida_pasillo_body_entered(body: Node2D) -> void:
	# Cambiamos la escena usando la ruta del archivo directamente
	if body.name == "player":
		# Aquí pasas la ruta y las coordenadas directamente
		Transicion.change_scene("res://Scenes/sala.tscn", Vector2(942, 350))
