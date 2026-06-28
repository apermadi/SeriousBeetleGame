## item handles its weight and associated sprite assignment

extends Area3D

@onready var sprite: Sprite3D = $ItemSprite;
@onready var audio: AudioStreamPlayer = $ItemSFX;

@export var dung: Texture;
@export var baby_bug: Texture;
@export var beetle: Texture;
@export var contemporary: Texture;
@export var puppy: Texture;
@export var thing: Texture;

var s_dung: AudioStream;
var s_baby_bug: AudioStream;
var s_beetle: AudioStream;
var s_contemporary: AudioStream;
var s_puppy: AudioStream;
var s_thing: AudioStream;

var texture_map: Array;
var sfx_map: Array;

signal stage_time;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_map.push_back(dung);
	texture_map.push_back(baby_bug);
	texture_map.push_back(beetle);
	texture_map.push_back(thing);
	texture_map.push_back(puppy);
	texture_map.push_back(contemporary);
	
	s_dung = preload("res://pixelcrusher-squish-pop-256410.ogg");
	s_baby_bug = preload("res://freesound_community-angry-baby-cry-36152.ogg");
	s_beetle = preload("res://pixelcrusher-squish-pop-256410.ogg");
	s_contemporary = preload("res://vote.ogg");
	s_puppy = preload("res://jonathanslattermusic-dog-barking-slightly-sad-needy-bark-535291.ogg");
	s_thing = preload("res://freesound_community-cartoon-scream-1-6835.ogg");
	
	sfx_map.push_back(s_dung);
	sfx_map.push_back(s_baby_bug);
	sfx_map.push_back(s_beetle);
	sfx_map.push_back(s_thing);
	sfx_map.push_back(s_puppy);
	sfx_map.push_back(s_contemporary);
	
	stage_time.connect(SizeManager._new_stage);
	
	# TODO: ensure a relatively sane distribution of items somehow
	match SizeManager.stage:
		1:
			var rand_weight = randi_range(1, 2);
			set_meta("weight", rand_weight);
			sprite.texture = texture_map[rand_weight-1];
			audio.set_stream(sfx_map[rand_weight-1]);
			if (sprite.texture == baby_bug):
				sprite.flip_h = true;
				sprite.scale = Vector3(2.0, 2.0, 2.0);
			SizeManager.max_weight += rand_weight;
		2:
			var rand_weight = randi_range(3, 4);
			set_meta("weight", rand_weight);
			sprite.texture = texture_map[rand_weight-1];
			audio.set_stream(sfx_map[rand_weight-1]);
			sprite.scale = Vector3(2.0, 2.0, 2.0);
			SizeManager.max_weight += rand_weight;
		3:
			var rand_weight = randi_range(5, 6);
			set_meta("weight", rand_weight);
			sprite.texture = texture_map[rand_weight-1];
			audio.set_stream(sfx_map[rand_weight-1]);
			sprite.scale = Vector3(2.5, 2.5, 2.5);
			SizeManager.max_weight += rand_weight;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	audio.play();
	SizeManager.update_player(get_meta("weight"));
	remove_child(sprite);
	remove_child($ItemCollider);
	sprite.scale = Vector3(0.05, 0.05, 0.05);
	# body.add_child(sprite);
	
	# TODO: spawn sprite on random point on edge or at the edge of the sphere. whatever is easier
	# appended: if i can do it in a reasonable amoutn of time
	
	if (SizeManager.player_weight >= SizeManager.max_weight):
		SizeManager.stage += 1;
		if (SizeManager.stage < 4):
			body.ascend();
		stage_time.emit();
	# queue_free();
