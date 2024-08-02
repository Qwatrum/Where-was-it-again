extends StaticBody2D

@onready var game := get_parent()
var clicked = false
var started = false
func create(show_time, size):
	$"Sprite2D".show()
	position = Vector2(randi_range(25, 1127),randi_range(25, 623))
	scale.x = 5*size/100
	scale.y = 5*size/100
	await get_tree().create_timer(show_time).timeout
	$"Sprite2D".hide()
	started = true
	
	


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not clicked and started:
		
		$"Sprite2D".show()
		game.star_clicked()
		clicked = true
