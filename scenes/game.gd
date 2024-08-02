extends Control

var star = preload("res://scenes/star.tscn")
var level = 0
var stars = []
var star_size = 100
var stars_clicked = 0
var started = false
func _ready():
	await get_tree().create_timer(1).timeout
	next_level()
	
	
func next_level():
	$"Timer".value = 100
	stars_clicked = 0
	level += 1
	for e in stars:
		e.queue_free()
	stars = []
	for i in level:
		var inste = star.instantiate()
		add_child(inste)
		stars.append(inste)
		inste.create(level*1.5+1,star_size)
	await get_tree().create_timer(level*1.5+1).timeout
	$"TimerNode".start()
	started = true

func star_clicked():
	await get_tree().create_timer(0.09).timeout
	stars_clicked+=1
	if stars_clicked == level:
		# next level
		star_size -= 5
		if star_size == 0:
			star_size = 5
		started = false
		$"TimerNode".stop()
		await get_tree().create_timer(1).timeout
		next_level()
		


func _on_timer_node_timeout():
	$"Timer".value-=1
	if $"Timer".value < 30:
		$"Timer/AnimationPlayer".play("shake")
	if $"Timer".value <= 0:
		for e in stars:
			e.queue_free()
		$"TimerNode".stop()
		stars = []
		print("Game Over")
		# add death stuffs

func _process(delta):
	if Input.is_action_just_pressed("click") and started:
		var a = stars_clicked
		await get_tree().create_timer(0.1).timeout
		if a == stars_clicked:
			$"Timer".value -= 20
		
