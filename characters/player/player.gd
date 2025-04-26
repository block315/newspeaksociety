extends CharacterBody2D

@export var speed = 300.0
@export var jump_speed = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		animated_sprite_2d.play("walk")
		velocity.x = direction * speed
		if direction > 0 and animated_sprite_2d.scale.x < 0:
			animated_sprite_2d.scale.x *= -1
		elif direction < 0 and animated_sprite_2d.scale.x > 0:
			animated_sprite_2d.scale.x *= -1
	else:
		animated_sprite_2d.play("idle")
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func _on_up_touch_screen_button_pressed() -> void:
	Input.action_press("ui_accept")

func _on_left_touch_screen_button_pressed() -> void:
	Input.action_press("ui_left")

func _on_right_touch_screen_button_pressed() -> void:
	Input.action_press("ui_right")

func _on_down_touch_screen_button_3_pressed() -> void:
	Input.action_press("ui_down")

func _on_up_touch_screen_button_released() -> void:
	Input.action_release("ui_accept")

func _on_left_touch_screen_button_released() -> void:
	Input.action_release("ui_left")

func _on_right_touch_screen_button_released() -> void:
	Input.action_release("ui_right")

func _on_down_touch_screen_button_3_released() -> void:
	Input.action_release("ui_down")
