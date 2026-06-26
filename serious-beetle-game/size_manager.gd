extends Node

var item_man: Node3D;
var player_weight: int = 0;
var max_weight: int = 0;
var stage = 1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func update_player(weight: int) -> void:
	player_weight += weight;
	item_man.update_meter(player_weight);


func _new_stage():
	item_man.spawn_stage(stage);
	item_man.meter.max_value = max_weight;
	pass
