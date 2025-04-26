extends Camera2D

@onready var base: Sprite2D = $"../../Base"

func _ready() -> void:
	limit_right = base.texture.get_size().x*base.scale.x
	limit_bottom = base.texture.get_size().y*base.scale.y
