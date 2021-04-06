extends KinematicBody2D

var speed : int = 4
var velocity = Vector2(0, 0)

func _emit_movement(event):
	var ev_emit = InputEventAction.new()
	ev_emit.action = event
	ev_emit.pressed = true
	Input.parse_input_event(ev_emit)

func _input(event):
		if event.is_action_pressed("move_right"):
			velocity.x = speed
		elif event.is_action_pressed("move_left"):
			velocity.x = -speed
		elif event.is_action_released("move_right") or event.is_action_released("move_left"):
			velocity.x = 0
		elif event is InputEventScreenTouch:
			if event.is_pressed():
				var position = event.get_position()[0]
				if position >= 144:
					_emit_movement("move_right")
				else:
					_emit_movement("move_left")
			else:
				velocity.x = 0

func _physics_process(delta):
	move_and_collide(velocity)
