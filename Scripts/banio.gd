extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Cambiamos la escena usando la ruta del archivo directamente
	if body.name == "player":
		# Aquí pasas la ruta y las coordenadas directamente
		Transicion.change_scene("res://Scenes/pasillo.tscn", Vector2(47, 6))
	pass # Replace with function body.
