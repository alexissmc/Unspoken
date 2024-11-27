extends Node2D

# Usamos preload para cargar la escena
var change_scene = load("res://Scenes/pasillo.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Cambiamos la escena usando la ruta del archivo directamente
	if body.name == "player":
		get_tree().change_scene_to_file(change_scene.resource_path)
