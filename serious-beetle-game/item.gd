## item handles its weight and associated sprite assignment

extends Area3D

@onready var sprite: Sprite3D = $ItemSprite;

@export var dung: Texture;
@export var baby_bug: Texture;
@export var zohran: Texture;
var texture_map: Array;

signal stage_time;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_map.push_back(dung);
	texture_map.push_back(baby_bug);
	texture_map.push_back(zohran);
	
	stage_time.connect(SizeManager._new_stage)
	
	# TODO: ensure a relatively sane distribution of items somehow
	match SizeManager.stage:
		1:
			var rand_weight = randi_range(1, 2);
			set_meta("weight", rand_weight);
			sprite.texture = texture_map[rand_weight-1];
			SizeManager.max_weight += rand_weight;
		2:
			var rand_weight = randi_range(3, 5);
			set_meta("weight", rand_weight);
			sprite.texture = texture_map[rand_weight-1];
			SizeManager.max_weight += rand_weight;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	SizeManager.update_player(get_meta("weight"));
	remove_child(sprite);
	sprite.scale = Vector3(0.05, 0.05, 0.05);
	body.add_child(sprite);
	
	# TODO: spawn sprite on random point on edge or at the edge of the sphere. whatever is easier
	queue_free();
	
	if (SizeManager.player_weight >= SizeManager.max_weight):
		SizeManager.stage += 1;
		stage_time.emit();
