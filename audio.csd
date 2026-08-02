<CsoundSynthesizer>
<CsOptions>
-+rtmidi=NULL -M0 --midi-key=4 --midi-velocity=5 -n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  iMidiKey = p4
  iMidiVelocity = p5
  
  kFreq mtof iMidiKey
  iAmp = iMidiVelocity / 127

  prints "iAmp = %d kFreq = %d\n", iAmp, kFreq

  aOut = vco2:a(iAmp, kFreq)

  outs aOut, aOut
endin

massign 0, 0
massign 0, 1

</CsInstruments>
<CsScore>
f 0 z
</CsScore>
</CsoundSynthesizer>

