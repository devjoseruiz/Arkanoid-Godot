extends Node

func _change_lvl(lvl):
	get_tree().change_scene("res://levels/level_" + str(lvl) + ".tscn")

func _on_button_level1_pressed():
	_change_lvl(1)

func _on_button_level2_pressed():
	_change_lvl(2)

func _on_button_level3_pressed():
	_change_lvl(3)

func _on_button_level4_pressed():
	_change_lvl(4)

func _on_button_level5_pressed():
	_change_lvl(5)

func _on_button_level6_pressed():
	_change_lvl(6)

func _on_button_level7_pressed():
	_change_lvl(7)

func _on_button_level8_pressed():
	_change_lvl(8)

func _on_button_level9_pressed():
	_change_lvl(9)

func _on_button_level10_pressed():
	_change_lvl(10)

func _on_button_level11_pressed():
	_change_lvl(11)

func _on_button_level12_pressed():
	_change_lvl(12)

func _on_exit_button_pressed():
	get_tree().quit()
