extends RigidBody3D

@onready var camera: Camera3D = $Camera
var mouse_pos: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.top_level = true;


func _physics_process(_delta: float) -> void:
	camera.global_position.x = position.x;
	camera.global_position.z = position.z;
	
	mouse_pos = get_viewport().get_mouse_position();
	mouse_pos = mouse_pos - Vector2(get_viewport().size)/2;
	mouse_pos = mouse_pos.normalized();
	
	if(Input.is_action_pressed("move")):
		linear_velocity.x -= mouse_pos.x*0.1;
		linear_velocity.z -= mouse_pos.y*0.1;
