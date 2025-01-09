extends Area2D

@export var speed: int
@export var rotation_speed: int
@export var direction_x: float

func _ready() -> void:
	var colors = ["Brown_", "Grey_"]
	var sizes = ["tiny", "small", "med", "big"]
	var type = ["1", "2"]
	var rng:= RandomNumberGenerator.new()
	
	var filename = "res://assets/space_shooter_redux/PNG/Meteors/meteor"+ colors[rng.randi_range(0,1)] + sizes[rng.randi_range(0,3)]+type[rng.randi_range(0,1)] +".png"
	$Sprite2D.texture = load(filename)
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	speed = rng.randi_range(100, 400)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(30, 150)
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0)* 400* delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print("body entered")
