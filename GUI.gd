extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var timer = $Timer
onready var timeText = $TimeText
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

#func _init():
	#timer = timer_scene.instance()
	#timer.start()
	#timer.autostart = true
	#timer.wait_time = 0.5
	#timer.connect("timeout", self, "_timeout")

func _process(delta):
	timeText.text = _format_seconds(timer.time_left, true)
	
func _format_seconds(time : float, use_milliseconds : bool) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	if not use_milliseconds:
		return "%02d:%02d" % [minutes, seconds]
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]


func _timeout():
	print("Timed out!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
