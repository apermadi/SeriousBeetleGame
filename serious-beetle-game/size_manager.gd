extends Node

var item_man;
var player_weight: int = 0;
var max_weight: int = 0;
var stage = 1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_man = preload("res://item_manager.gd");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func update_player(weight: int) -> void:
	player_weight += weight;


func _new_stage():
	print("holy moly");
	pass
