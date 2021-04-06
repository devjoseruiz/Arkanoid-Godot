extends RigidBody2D

onready var break_sound : AudioStreamPlayer = get_node("break")
onready var start_sound : AudioStreamPlayer = get_node("start")
onready var you_win_sound : AudioStreamPlayer = get_node("you_win")
onready var lose_sound : AudioStreamPlayer = get_node("lose")
onready var hit_sound : AudioStreamPlayer = get_node("hit")

var game_started : bool = false
var speed_y : int = -200
var speed_x : int = 0

var replay_scn = load("res://menu/replay.tscn")

func _start_game(init_x):
	speed_x = init_x
	linear_velocity = Vector2(speed_x, speed_y)
	game_started = true
	start_sound.play()

func _input(event):
	if not game_started:
		if event.is_action_pressed("move_right"):
			_start_game(50)
		elif event.is_action_pressed("move_left"):
			_start_game(-50)

func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_sound.play()

			if get_tree().get_nodes_in_group("gr_blocks").size() == 1:
				you_win_sound.play()
				get_tree().paused = true
				yield(you_win_sound, "finished")
				queue_free()
				get_parent().add_child(replay_scn.instance())

		elif body.get_name() == "border_bottom":
			lose_sound.play()
			get_tree().paused = true
			yield(lose_sound, "finished")
			queue_free()
			get_parent().add_child(replay_scn.instance())

		else:
			hit_sound.play()
