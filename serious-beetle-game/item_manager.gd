extends Node3D

@export var field_size: Vector3;
var item: PackedScene;
var item_inst: Area3D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item = preload("res://item.tscn");
	
	# here is where to spawn items
	# maybe in the creation of the items themselves is where they're assigned their size/points
	# remember some sort of global coutner to track numbers
	# oh waiter! bulky statement please!!
	for i in range(6):
		item_inst = item.instantiate();
		add_child(item_inst);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
