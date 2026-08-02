extends Node2D

@onready
var synth: Synth = $Synth


func _ready() -> void:
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())


func _input(input_event):
	if input_event is InputEventMIDI:
		_send_midi_info(input_event)


func _send_midi_info(midi_event):
	print(midi_event)
	print("Channel ", midi_event.channel)
	print("Message ", midi_event.message)
	print("Pitch ", midi_event.pitch)
	print("Velocity ", midi_event.velocity)
	print("Instrument ", midi_event.instrument)
	print("Pressure ", midi_event.pressure)
	print("Controller number: ", midi_event.controller_number)
	print("Controller value: ", midi_event.controller_value)
	print("")

	if midi_event.message == MIDI_MESSAGE_NOTE_ON:
		synth.csound.note_on(midi_event.channel, midi_event.pitch, midi_event.velocity)
	if midi_event.message == MIDI_MESSAGE_NOTE_OFF:
		synth.csound.note_off(midi_event.channel, midi_event.pitch)
	if midi_event.message == MIDI_MESSAGE_CONTROL_CHANGE:
		synth.csound.control_change(midi_event.channel, midi_event.controller_number, midi_event.controller_value)
