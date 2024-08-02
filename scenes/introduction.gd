extends Control

var intro = ["It needs food", "You need to give it food", "Be quick", "Click all the stars", "Before time runs out...", "If you miss click...", "you will loose\nalot of time", "("]

func _ready():
	var player = $"Introduction/AnimationPlayer"
	player.play("fade_animation")
	for i in intro:
		$"Introduction".text = i
		
		await get_tree().create_timer(2.5).timeout
	$"Introduction".hide()
	await get_tree().create_timer(0.5).timeout
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_skip_button_down():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
