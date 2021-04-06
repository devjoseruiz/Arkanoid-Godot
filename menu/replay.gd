extends Node

func _on_replay_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_back_button_pressed():
	get_tree().change_scene("res://menu/levels.tscn")
	get_tree().paused = false

func _on_exit_button_pressed():
	get_tree().quit()
