extends Control

func _on_play_mouse_entered() -> void:
	$Buttonsound.play()
	pass # Replace with function body.

func _on_play_pressed() -> void:
	
	#get_tree().change_scene_to_file("res://Scenes/pasillo.tscn")
	Transicion.change_scene("res://Scenes/pasillo.tscn", Vector2(313, 6))
	
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	
