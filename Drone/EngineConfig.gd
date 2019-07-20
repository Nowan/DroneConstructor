extends RigidBody2D

const FORCE_MULTIPLIER = 2
const MAX_ACCELERATION = -350
const MAX_DEFFERING = 350

const MIN_PITCH = 0.1
const MAX_PITCH = 15

var AUDIO_START = load("res://Drone/engine_start.wav")
var AUDIO_RUNNING = load("res://Drone/engine_running.wav")
var AUDIO_STOP = load("res://Drone/engine_stop.wav")

var enginePreStartPitch = 0
var enginePreStopStatus = 0
var framesPlaying = 0

func _set_calculated_force(engineSide, engineStatus):
	var appliedForce = Vector2(0,engineStatus)
	set_applied_force(appliedForce.rotated(global_rotation))
	#print("Current " +engineSide + "Engine status: ", engineStatus)
	#print("Rotation R: ", global_rotation)

func audio_tick(sound, engineStatus, enginePreviousStatus):
	if engineStatus == 0 and enginePreviousStatus != 0:
		print("off")
		enginePreStopStatus = enginePreviousStatus
		sound.pitch_scale = 1
		sound.stream = AUDIO_STOP
		sound.playing = false
		sound.playing = true
		framesPlaying == 0
	elif engineStatus == 0 and enginePreviousStatus == 0:
		if sound.playing == true:
			framesPlaying += 1
			var x = (float(framesPlaying) / 60) / AUDIO_STOP.get_length()
			var y = max(pow(-x, 4), 0)
			var eng_pitch = get_pitch(enginePreStopStatus)
			var enginePreStartPitch = eng_pitch + (0.1 - eng_pitch) * y
			sound.pitch_scale = enginePreStartPitch
	elif engineStatus != 0 and enginePreviousStatus == 0:
		print("on")
		sound.pitch_scale = 1
		sound.stream = AUDIO_START
		sound.playing = false
		sound.playing = true
		framesPlaying = 0
	elif engineStatus != 0:
		if sound.playing == true and sound.stream == AUDIO_START:
			framesPlaying += 1
			var x = (float(framesPlaying) / 60) / AUDIO_START.get_length()
			var y = min(pow(x * 2, 2), 1)
			var target_pitch = get_pitch(engineStatus)
			sound.pitch_scale = enginePreStartPitch + (target_pitch - enginePreStartPitch) * y
		if sound.playing == false and sound.stream != AUDIO_RUNNING:
			sound.stream = AUDIO_RUNNING
			sound.playing = true
		if sound.stream == AUDIO_RUNNING:
			var pitch = get_pitch(engineStatus)
			sound.pitch_scale = pitch

func get_pitch(engineStatus):
	var maxStatus = 0
	
	if (engineStatus < 0):
		maxStatus = MAX_ACCELERATION
	else:
		maxStatus = MAX_DEFFERING
	
	var statusRatio = float(engineStatus) / maxStatus
	return MIN_PITCH + (MAX_PITCH - MIN_PITCH) * statusRatio