extends Node2D


var channel: int = 0
var note: int = 60
var velocity: int = 90


signal note_on(channel: int, note: int, velocity: int)
signal note_off(channel: int, note: int)


func _on_button_on_pressed() -> void:
	note_on.emit(channel, note, velocity)


func _on_button_off_pressed() -> void:
	note_off.emit(channel, note)
