extends Node2D

func _ready():
	$"Sprite2D".hide()
	
func spook():
	$"Sprite2D".show()
	$"Sprite2D/AnimationPlayer".play("scare")
