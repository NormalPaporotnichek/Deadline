extends Camera2D


onready var player = get_node("/root/Node/Player")
onready var pause = get_node("/root/Node/Pause")

const Dead_Zone = 60

# Lower cap for the `_zoom_level`.
export var min_zoom := 1
# Upper cap for the `_zoom_level`.
export var max_zoom := 2.2
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
export var zoom_factor := 0.1
# Duration of the zoom's tween animation.
export var zoom_duration := 0.2

# The camera's target zoom level.
var _zoom_level := 1.0 setget _set_zoom_level

# We store a reference to the scene's tween node.
onready var tween: Tween = $Tween


func _set_zoom_level(value: float) -> void:
	# We limit the value between `min_zoom` and `max_zoom`
	_zoom_level = clamp(value, min_zoom, max_zoom)
	# Then, we ask the tween node to animate the camera's `zoom` property from its current value
	# to the target zoom level.
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(_zoom_level, _zoom_level),
		zoom_duration,
		tween.TRANS_SINE,
		# Easing out means we start fast and slow down as we reach the target value.
		tween.EASE_OUT
	)
	tween.start()


func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		# Inside a given class, we need to either write `self._zoom_level = ...` or explicitly
		# call the setter function to use it.
		_set_zoom_level(_zoom_level - zoom_factor)
	if event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)
	

var spd = 25
var radius_required_to_move = 100

func _ready():
	position.x = player.position.x
	position.y = player.position.y
	
func _process(delta):	
	var mouse_position = get_global_mouse_position()
	var mouse_delta = mouse_position - global_position
	if (mouse_delta.length() >= radius_required_to_move):
		position += (mouse_delta / radius_required_to_move) * spd * delta
		
#func _process (delta):
	#if get_viewport().size.x==5:
	#position.x = player.position.x
	#position.y = player.position.y



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
