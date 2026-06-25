## manager handles spawning logic

extends Node3D

var item: PackedScene;
var item_inst: Area3D;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item = preload("res://item.tscn");
	
	# here is where to spawn items ~initially~
	# maybe in the creation of the items themselves is where they're assigned their size/points
	
	spawn_stage(SizeManager.stage);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# oh waiter! bulky statement please!!
func spawn_stage(curr_stage: int):
	match curr_stage:
		1:
			print("stage one");
			for i in range(5):
				item_inst = item.instantiate();
				item_inst.position = Vector3(randf_range(-2.0, 2.0), 0.0, randf_range(-2.0, 2.0));
				add_child(item_inst);
		2:
			print("stage two");
			for i in range(6):
				item_inst = item.instantiate();
				item_inst.position = Vector3(randf_range(-4.0, 4.0), 0.0, randf_range(-4.0, 4.0));
				add_child(item_inst);
			
