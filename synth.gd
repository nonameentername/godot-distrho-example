extends Node2D
class_name Synth


var csound: CsoundInstance

var default_channel: int = 0
var default_note: int = 64
var default_velocity: int = 90


func _ready() -> void:
	CsoundServer.csound_ready.connect(_on_csound_ready)


func _on_csound_ready(csound_name: String):
	csound = CsoundServer.get_csound(csound_name)


func note_on(channel: int, note: int, velocity) -> void:
	print("Note On: channel: ", channel, " note: ", note, " velocity: ", velocity)
	csound.note_on(default_channel, note, velocity)


func note_off(channel: int, note: int) -> void:
	print("Note Off: channel: ", channel, " note: ", note)
	csound.note_off(default_channel, note)
