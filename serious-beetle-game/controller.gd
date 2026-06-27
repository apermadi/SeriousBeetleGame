extends RigidBody3D

@onready var camera: Camera3D = $Camera
@onready var ball: CSGSphere3D = $Ball
@onready var collider: CollisionShape3D = $BallCollider

@export var earth: Node3D;

@export var camera_size: float = 2.177;
@export var ball_size: float = 1.7;

@export var camera_scalar: float = 1.0;
@export var ball_scalar: float = 1.0;


var mouse_pos: Vector2;
var ball_tween: Tween;
var camera_tween: Tween;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.top_level = true;


func _physics_process(_delta: float) -> void:
	if (SizeManager.stage < 4):
		camera.global_position.x = position.x;
		camera.global_position.z = position.z;
		
		mouse_pos = get_viewport().get_mouse_position();
		mouse_pos = mouse_pos - Vector2(get_viewport().size)/2;
		mouse_pos = mouse_pos.normalized();
		
		if(Input.is_action_pressed("move")):
			linear_velocity.x -= mouse_pos.x*0.1;
			linear_velocity.z -= mouse_pos.y*0.1;
	else:	
		if (Input.is_action_pressed("move")):
			print("hi");
			# look_at(earth.global_position, Vector3.UP, true);
			#linear_velocity.x += delta*0.6;
			#linear_velocity.z -= delta*0.6;


func ascend() -> void:
	if (SizeManager.stage < 4):
		ball_tween = get_tree().create_tween();
		ball_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS);
		camera_tween = get_tree().create_tween();
		
		ball_tween.tween_property(ball, "scale", ball.scale * ball_scalar, 1.5).set_trans(Tween.TRANS_CIRC);
		camera_tween.tween_property(camera, "size", camera.size * camera_scalar, 1.6).set_trans(Tween.TRANS_QUART);
		camera_scalar += 0.3;
		collider.scale = ball.scale;


func final_stage() -> void:
	freeze = true;
	linear_velocity = Vector3.ZERO;
	angular_velocity = Vector3.ZERO;
	position = Vector3(0.0, 0.379, 0.0);
	rotation = Vector3.ZERO;
	ball.scale *= ball_scalar;
