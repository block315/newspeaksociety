extends RigidBody2D
class_name Word

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

func _ready() -> void:
	label.text = self.name
	collision_shape_2d.shape.size = label.size
	collision_shape_2d.position = label.position + collision_shape_2d.shape.size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
