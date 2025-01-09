extends CharacterBody2D

@export var speed: int = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)

func rotate_player(sprint: bool) -> void:
	var mul = 1.5 if sprint else 1
	if Input.is_key_pressed(KEY_A):
		$PlayerImage.rotation=-0.2*mul
	elif Input.is_key_pressed(KEY_D):
		$PlayerImage.rotation=0.2*mul
	else:
		$PlayerImage.rotation=0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var sprint = Input.is_action_pressed("sprint")
	rotate_player(sprint)
	var mul = 1.5 if sprint else 1
	var directions = Input.get_vector("left", "right", "up", "down")
	velocity = directions * speed * mul
	move_and_slide()
	if speed<2.0:
		speed*=(1.1/delta)
