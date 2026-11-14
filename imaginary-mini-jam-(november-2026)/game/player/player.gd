class_name Player extends Node2D


const STARTING_ALTITUDE : float = 5000.0
const PRESSURE_TO_POP : float = 1.0


@export_group("Helium")
@export var starting_helium : float = 150000
@export var helium_release_amount : float = 1000.0

@export_group("Pressure")
@export var pressure_release_amount : float = 0.0
@export var pressure_increase_per_altitude_deviation : float = 10.0

@export_group("Gobbo")
@export var sway_strength : float = 50.0


var helium : float = 0.0
var pressure : float = 0.0

var altitude : float = 0.0


@onready var gobbo : RigidBody2D = %Gobbo


func _ready() -> void:
	helium = starting_helium


func _physics_process(_delta : float) -> void:
	_handle_input()


func _handle_input() -> void:
	if Input.is_action_pressed("sway_left"):
		gobbo.set_axis_velocity(Vector2.LEFT * sway_strength)
	elif Input.is_action_pressed("sway_right"):
		gobbo.set_axis_velocity(Vector2.RIGHT * sway_strength)

	if Input.is_action_pressed("release_helium"):
		
