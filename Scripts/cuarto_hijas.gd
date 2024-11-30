extends Node2D

# Usamos preload para cargar la escena


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		# Aquí pasas la ruta y las coordenadas directamente
		Transicion.change_scene("res://Scenes/pasillo_2.tscn", Vector2(80, 22))
	pass # Replace with function body.
