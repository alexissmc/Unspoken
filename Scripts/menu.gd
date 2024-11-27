extends Control

func _on_texture_rect_mouse_entered() -> void:
	
	pass # Replace with function body.

func _on_play_pressed() -> void:
	$Buttonsound.play()
	get_tree().change_scene_to_file("res://Scenes/pasillo.tscn")
	
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	
