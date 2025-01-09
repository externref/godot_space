extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
