## item handles its weight and associated sprite assignment

extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: ensure a relatively sane distribution of items
	var rand_weight = randi_range(1, 5);
	set_meta("weight", rand_weight);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node3D) -> void:
	print(get_meta("weight"));
	pass # Replace with function body.
