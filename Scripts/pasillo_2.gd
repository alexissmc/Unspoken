extends Node2D

# Usamos preload para cargar la escena
var change_scene = load("res://Scenes/sala.tscn")

	# Cambiamos la escena usando la ruta del archivo directamente
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		#get_tree().change_scene_to_file(change_scene.resource_path)
		Transicion.change_scene("res://Scenes/sala.tscn", Vector2(227, 349))
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "player":
		#get_tree().change_scene_to_file(change_scene.resource_path)
		Transicion.change_scene("res://Scenes/cuarto_padres.tscn", Vector2(3, 36))
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "player":
		#get_tree().change_scene_to_file(change_scene.resource_path)
		Transicion.change_scene("res://Scenes/cuarto_hijas.tscn", Vector2(579, 359))
	pass # Replace with function body.
