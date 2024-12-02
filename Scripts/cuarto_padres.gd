extends Node2D

# Usamos preload para cargar la escena
var change_scene = load("res://Scenes/pasillo_2.tscn")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Cambiamos la escena usando la ruta del archivo directamente
	if body.name == "player":
		#get_tree().change_scene_to_file(change_scene.resource_path)
		Transicion.change_scene("res://Scenes/pasillo_2.tscn", Vector2(81, -17))
	pass # Replace with function body.


func _on_final_body_entered(body: Node2D) -> void:
	if body.name == "player":
		#get_tree().change_scene_to_file(change_scene.resource_path)
		get_tree().change_scene_to_file("res://Scenes/Victory.tscn")
	pass # Replace with function body.
