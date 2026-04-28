extends Node

@onready var fade = $"../ColorRect"

var is_transitioning = false

func change_scene(path: String):
	if is_transitioning:
		return
	
	is_transitioning = true
	
	await fade_out()
	get_tree().change_scene_to_file(path)
	await get_tree().process_frame
	await fade_in()
	
	is_transitioning = false


func fade_out():
	fade.visible = true
	fade.modulate.a = 0.0
	
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 0.4)
	
	await tween.finished


func fade_in():
	fade.modulate.a = 1.0
	
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 0.4)
	
	await tween.finished
	
	fade.visible = false