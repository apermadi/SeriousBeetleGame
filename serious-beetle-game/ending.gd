extends Control


@onready var end_ani: AnimationPlayer = $End

var current_line = 0;
var can_forward = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


func _input(event: InputEvent) -> void:
	if (!can_forward):
		pass
	if (event.is_action_pressed("move")):
		current_line += 1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
