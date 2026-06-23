extends RigidBody3D

@onready var camera: Camera3D = $Camera
@onready var light: DirectionalLight3D = $Light

var mouse_pos;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.top_level = true;
	light.top_level = true;

func _physics_process(delta: float) -> void:
	mouse_pos = get_viewport().get_mouse_position();
	mouse_pos = mouse_pos - Vector2(get_viewport().size)/2;
	mouse_pos = mouse_pos.normalized();
	
	if(Input.is_action_pressed("move")):
		linear_velocity.x -= mouse_pos.x*delta;
		linear_velocity.z -= mouse_pos.y*delta;
