## manager handles spawning logic

extends Node3D

@export var meter: ProgressBar;

var item: PackedScene;
var item_inst: Area3D;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeManager.item_man = self;
	item = preload("res://item.tscn");
	
	spawn_stage(SizeManager.stage);
	meter.max_value = SizeManager.max_weight;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# oh waiter! bulky statement please!!
func spawn_stage(curr_stage: int):
	match curr_stage:
		1:
			print("stage one");
			for i in range(7):
				item_inst = item.instantiate();
				item_inst.position = Vector3(randf_range(-2.5, 2.8), 0.0, randf_range(-2.0, 2.0));
				add_child(item_inst);
		2:
			print("stage two");
			for i in range(9):
				item_inst = item.instantiate();
				item_inst.position = Vector3(randf_range(-3.9, 4.0), 0.0, randf_range(-4.0, 4.0));
				add_child(item_inst);
		3:
			print("stage three");
			for i in range(11):
				item_inst = item.instantiate();
				item_inst.position = Vector3(randf_range(-5.8, 6.2), 0.0, randf_range(-6.0, 6.0));
				add_child(item_inst);


func update_meter(weight: float) -> void:
	meter.value = weight;
