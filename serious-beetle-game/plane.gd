extends CSGBox3D

@export var star_plane: MeshInstance3D;
@export var earth: Node3D;
@export var earth_ani: AnimationPlayer;
@export var light: DirectionalLight3D;
@export var player_camera: Camera3D;
@export var final_camera: Camera3D;
var transition: Tween;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	star_plane.process_mode = Node.PROCESS_MODE_ALWAYS;
	earth.process_mode = Node.PROCESS_MODE_ALWAYS;
	player_camera.process_mode = Node.PROCESS_MODE_ALWAYS;
	final_camera.process_mode = Node.PROCESS_MODE_ALWAYS;
	process_mode = Node.PROCESS_MODE_ALWAYS;
	
	star_plane.visible = false
	earth.visible = false;


func switch_ground() -> void:
	visible = false;
	star_plane.visible = true;
	earth.visible = true;
	earth_ani.play("rotate");


func switch_camera() -> void:
	player_camera.current = false;
	final_camera.current = true;
	light.rotation.x = -155;
	player_camera.queue_free()
