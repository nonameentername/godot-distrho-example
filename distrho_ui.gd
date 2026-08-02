extends Node2D


func _ready() -> void:
	print("godot-distrho version: ", DistrhoPluginServer.get_version(), " build: ", DistrhoPluginServer.get_build())

	DistrhoUIServer.parameter_changed.connect(_on_parameter_changed)
	DistrhoUIServer.state_changed.connect(_on_state_changed)


func _input(input_event: InputEvent) -> void:
	if input_event is InputEventMIDI:
		var midi_event: InputEventMIDI = input_event
		if midi_event.message == MIDI_MESSAGE_NOTE_ON:
			DistrhoUIServer.send_note_on(midi_event.channel, midi_event.pitch, midi_event.velocity)
		if midi_event.message == MIDI_MESSAGE_NOTE_OFF:
			DistrhoUIServer.send_note_off(midi_event.channel, midi_event.pitch)
		if midi_event.message == MIDI_MESSAGE_CONTROL_CHANGE:
			print ("channel = ", midi_event.channel,
					" controller = ", midi_event.controller_number,
					" value = ",  midi_event.controller_value)


func _on_parameter_changed(index: int, value: float) -> void:
	pass


func _on_state_changed(key: String, value: String) -> void:
	pass


func _on_synth_ui_note_on(channel: int, note: int, velocity: int) -> void:
	DistrhoUIServer.send_note_on(channel, note, velocity)


func _on_synth_ui_note_off(channel: int, note: int) -> void:
	DistrhoUIServer.send_note_off(channel, note)
