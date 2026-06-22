extends RigidBody3D

@onready var camera: Camera3D = $Camera
@onready var light: DirectionalLight3D = $Light

var mouse_pos;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.top_level = true;
	light.top_level = true;

func _physics_process(delta: float) -> void:
	var viewport = get_viewport();
	
	if(Input.is_action_pressed("move")):
		angular_velocity.x -= 20*delta
