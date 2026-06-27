extends Control


@onready var end_ani: AnimationPlayer = $End

var current_line: int = 0;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continue_text();
	pass


func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("move")):
		# end_ani.stop();
		current_line = current_line + 1;
		continue_text();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func continue_text() -> void:
	match current_line:
		0:
			end_ani.play("line_0")
		1:
			end_ani.play("line_1")
		2:
			end_ani.play("line_2")
		3:
			end_ani.play("line_3")
		4:
			end_ani.play("line_4")
		5:
			end_ani.play("line_5")
		6:
			end_ani.play("line_6")
		7:
			end_ani.play("line_7")
		8:
			end_ani.play("line_8")
	pass
