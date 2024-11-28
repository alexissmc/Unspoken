extends CanvasLayer

@onready var anim = $AnimationPlayer

func _ready():
	layer  = -1
	$AnimationPlayer.play("sala-pasillo")
	
func change_scene(path : String) -> void:
	layer=1
	anim.play("sala-pasillo")
	await ($AnimationPlayer. animation_finished)
	get_tree().change_scene_to_file(path)
	anim.play_backwards("sala-pasillo")
	await ($AnimationPlayer. animation_finished)
	layer=-1
