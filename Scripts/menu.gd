extends Control



func _on_play_pressed() -> void:
	$Buttonsound.play()
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	
