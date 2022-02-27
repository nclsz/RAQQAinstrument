(

~files = PathName(thisProcess.nowExecutingPath).parentPath ++ "audio/";
///////////////////////Synth////////////////////////////

SynthDef.new(\sampler, {
	arg buf, rate = 1, spos = 0, out = 0,speed = 1, atk = 0.01, rel= 0.01, sus = 1, amp = 0.1, pan = 0;
	var sig, t_trig, env;
	t_trig = Impulse.ar(speed);
	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [0, 0, 0]), t_trig, doneAction: 2);
	sig = PlayBuf.ar(2, buf, rate, t_trig,  spos);
	sig = sig * env;
	sig = Balance2.ar(sig[0], sig[1], pan, amp);
	Out.ar(out, sig);
}).add;


b = Buffer.read(s, ~files ++ "bell01.wav");

~ps1 = Pbind(
	\instrument, \sampler,
	\buf, Pdefn(\sample1, b.bufnum),
	\dur, Pdefn(\sdur1, 1),
	\speed, Pdefn(\samp1speed, 1),
	\sus, Pdefn(\samp1sus, 0.5),
	\rate, Pdefn(\ratesamp1, 0.5),
	\spos, Pdefn(\spossamp1, 0),
	\loop, Pdefn(\loopsamp1, 0),
	\pan, Pdefn(\pansamp1, 0),
	\amp, Pdefn(\ampsamp1, 0));

////////// Synth 2////////////

SynthDef.new(\sampler2, {
	arg buf2, rate = 1, spos = 0, out = 0,speed = 1, atk = 0.01, rel= 0.01, sus = 1, amp = 0.1, pan = 0;
	var sig, t_trig, env;
	t_trig = Impulse.ar(speed);
	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [0, 0, 0]), t_trig, doneAction: 2);
	sig = PlayBuf.ar(2, buf2, rate, t_trig,  spos);
	sig = sig * env;
	sig = Balance2.ar(sig[0], sig[1], pan, amp);
	Out.ar(out, sig);
}).add;


~b2 = Buffer.read(s, ~files ++ "bell01.wav");

~ps2 = Pbind(
	\instrument, \sampler2,
	\buf2, Pdefn(\sample2, ~b2.bufnum),
	\dur, Pdefn(\sdur2, 1),
	\speed, Pdefn(\samp2speed, 1),
	\sus, Pdefn(\samp2sus, 0.5),
	\rate, Pdefn(\ratesamp2, 0.5),
	\spos, Pdefn(\spossamp2, 0),
	\loop, Pdefn(\loopsamp2, 0),
	\pan, Pdefn(\pansamp2, 0),
	\amp, Pdefn(\ampsamp2, 0));





//////////// Synth 3 ////////////



SynthDef.new(\sampler3, {
	arg buf3, rate = 1, spos = 0, out = 0,speed = 1, atk = 0.01, rel= 0.01, sus = 1, amp = 0.1, pan = 0;
	var sig, t_trig, env;
	t_trig = Impulse.ar(speed);
	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [0, 0, 0]), t_trig, doneAction: 2);
	sig = PlayBuf.ar(2, buf3, rate, t_trig,  spos);
	sig = sig * env;
	sig = Balance2.ar(sig[0], sig[1], pan, amp);
	Out.ar(out, sig);
}).add;


~b3 = Buffer.read(s, ~files ++ "bell01.wav");

~ps3 = Pbind(
	\instrument, \sampler3,
	\buf3, Pdefn(\sample3, ~b3.bufnum),
	\dur, Pdefn(\sdur3, 1),
	\speed, Pdefn(\samp3speed, 1),
	\sus, Pdefn(\samp3sus, 0.5),
	\rate, Pdefn(\ratesamp3, 0.5),
	\spos, Pdefn(\spossamp3, 0),
	\loop, Pdefn(\loopsamp3, 0),
	\pan, Pdefn(\pansamp3, 0),
	\amp, Pdefn(\ampsamp3, 0)
);




//////////// Synth 4 ////////////



SynthDef.new(\sampler4, {
	arg buf4, rate = 1, spos = 0, out = 0,speed = 1, atk = 0.01, rel= 0.01, sus = 1, amp = 0.1, pan = 0;
	var sig, t_trig, env;
	t_trig = Impulse.ar(speed);
	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [0, 0, 0]), t_trig, doneAction: 2);
	sig = PlayBuf.ar(2, buf4, rate, t_trig,  spos);
	sig = sig * env;
	sig = Balance2.ar(sig[0], sig[1], pan, amp);
	Out.ar(out, sig);
}).add;


~b4 = Buffer.read(s, ~files ++ "bell01.wav");

~ps4 = Pbind(
	\instrument, \sampler4,
	\buf4, Pdefn(\sample4, ~b4.bufnum),
	\dur, Pdefn(\sdur4, 1),
	\speed, Pdefn(\samp4speed, 1),
	\sus, Pdefn(\samp4sus, 0.5),
	\rate, Pdefn(\ratesamp4, 0.5),
	\spos, Pdefn(\spossamp4, 0),
	\loop, Pdefn(\loopsamp4, 0),
	\pan, Pdefn(\pansamp4, 0),
	\amp, Pdefn(\ampsamp4, 0)
);




////////////////////Synth Noise 1///////////////

SynthDef.new(\noise, {

	arg freq1 = 0, q1 = 0, bmul1 = 0,
	freq2 = 0, q2 = 0, bmul2 = 0,

	atk= 0.001, sus = 1, rel = 0.01,
	atkcv = 0, relcv = 0,
	t_gate = 1,amp = 0.2, pan = 0, out = 0;


	var sig, env;

	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [atkcv, 0, relcv]), t_gate, doneAction: 2);


	sig = WhiteNoise.ar();
	sig = BBandPass.ar(sig, freq1, q1, bmul1);
	sig = sig + BBandPass.ar(WhiteNoise.ar(), freq2, q2, bmul2);
	sig = Clip.ar(sig, -0.2, 0.2);
	sig = sig * env;
	sig = sig * amp;
	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;




p =  Pbind(
	\instrument, \noise,
	\dur, Pdefn(\synthtime, Pwhite(0.1, 0.3)),
	\sus, Pdefn(\synthdur, Pwhite(0.01, 0.1)),
	\pan, Pdefn(\synthpan, 0),
	\freq1, Pdefn(\freq1, 100),
	\q1, Pdefn(\q1, 0),
	\bmul1, Pdefn(\bmul1, 1),
	\freq2, Pdefn(\freq2, 100),
	\q2, Pdefn(\q2, 0),
	\bmul2, Pdefn(\bmul2, 0),
	\amp, Pdefn(\amp, 0)
);





///////////////// Synth Noise 2 /////////////

SynthDef.new(\noise2, {

	arg freq1 = 0, q1 = 0, bmul1 = 0,
	freq2 = 0, q2 = 0, bmul2 = 0,

	atk= 0.001, sus = 1, rel = 0.01,
	atkcv = 0, relcv = 0,
	t_gate = 1,amp = 0.2, pan = 0, out = 0;


	var sig, env;

	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [atkcv, 0, relcv]), t_gate, doneAction: 2);


	sig = WhiteNoise.ar();
	sig = BBandPass.ar(sig, freq1, q1, bmul1);
	sig = sig + BBandPass.ar(WhiteNoise.ar(), freq2, q2, bmul2);
	sig = Clip.ar(sig, -0.2, 0.2);
	sig = sig * env;
	sig = sig * amp;
	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;




~p2 =  Pbind(
	\instrument, \noise2,
	\dur, Pdefn(\synthtime2, Pwhite(0.1, 0.3)),
	\sus, Pdefn(\synthdur2, Pwhite(0.01, 0.1)),
	\pan, Pdefn(\synthpan2, 0),
	\freq1, Pdefn(\freq12, 100),
	\q1, Pdefn(\q12, 0),
	\bmul1, Pdefn(\bmul12, 1),
	\freq2, Pdefn(\freq22, 100),
	\q2, Pdefn(\q22, 0),
	\bmul2, Pdefn(\bmul22, 0),
	\amp, Pdefn(\amp2, 0)
);



///////////////// Synth Noise 3 /////////////

SynthDef.new(\noise3, {

	arg freq1 = 0, q1 = 0, bmul1 = 0,
	freq2 = 0, q2 = 0, bmul2 = 0,

	atk= 0.001, sus = 1, rel = 0.01,
	atkcv = 0, relcv = 0,
	t_gate = 1,amp = 0.2, pan = 0, out = 0;


	var sig, env;

	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [atkcv, 0, relcv]), t_gate, doneAction: 2);


	sig = WhiteNoise.ar();
	sig = BBandPass.ar(sig, freq1, q1, bmul1);
	sig = sig + BBandPass.ar(WhiteNoise.ar(), freq2, q2, bmul2);
	sig = Clip.ar(sig, -0.2, 0.2);
	sig = sig * env;
	sig = sig * amp;
	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;




~p3 =  Pbind(
	\instrument, \noise3,
	\dur, Pdefn(\synthtime3, Pwhite(0.1, 0.3)),
	\sus, Pdefn(\synthdur3, Pwhite(0.01, 0.1)),
	\pan, Pdefn(\synthpan3, 0),
	\freq1, Pdefn(\freq13, 100),
	\q1, Pdefn(\q13, 0),
	\bmul1, Pdefn(\bmul13, 1),
	\freq2, Pdefn(\freq23, 100),
	\q2, Pdefn(\q23, 0),
	\bmul2, Pdefn(\bmul23, 0),
	\amp, Pdefn(\amp3, 0)
);



///////////////// Synth Noise 4 /////////////

SynthDef.new(\noise4, {

	arg freq1 = 0, q1 = 0, bmul1 = 0,
	freq2 = 0, q2 = 0, bmul2 = 0,

	atk= 0.001, sus = 1, rel = 0.01,
	atkcv = 0, relcv = 0,
	t_gate = 1,amp = 0.2, pan = 0, out = 0;


	var sig, env;

	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [atkcv, 0, relcv]), t_gate, doneAction: 2);


	sig = WhiteNoise.ar();
	sig = BBandPass.ar(sig, freq1, q1, bmul1);
	sig = sig + BBandPass.ar(WhiteNoise.ar(), freq2, q2, bmul2);
	sig = Clip.ar(sig, -0.2, 0.2);
	sig = sig * env;
	sig = sig * amp;
	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;




~p4 =  Pbind(
	\instrument, \noise4,
	\dur, Pdefn(\synthtime4, Pwhite(0.1, 0.3)),
	\sus, Pdefn(\synthdur4, Pwhite(0.01, 0.1)),
	\pan, Pdefn(\synthpan4, 0),
	\freq1, Pdefn(\freq14, 100),
	\q1, Pdefn(\q14, 0),
	\bmul1, Pdefn(\bmul14, 1),
	\freq2, Pdefn(\freq24, 100),
	\q2, Pdefn(\q24, 0),
	\bmul2, Pdefn(\bmul24, 0),
	\amp, Pdefn(\amp4, 0)
);




///////////////// Synth Couic ////////////////////

SynthDef.new(\couic, {

	arg car,bfreq, bw, bmul;
	var sig, pan;
	pan = LFNoise1.kr(4, 1);
	sig = LFPulse.ar(((car * [0.5, 0.75, 0.95, 1.05,1.36])+ SinOsc.ar(LFNoise1.kr(3,25.0, 25.0), mul:LFNoise1.kr(30,500,500)* [0.5, 0.75, 0.95, 1.05,1.36] )),[0,0.1],0.2, 1);
	sig =  BBandPass.ar(sig, bfreq.lag(0.5), bw,bmul);
	sig = sig * 0.2;
	sig = Pan2.ar(sig, pan);
	Out.ar(0, sig);
}).add;

/////////////////// GUI ////////////////////////



Window.closeAll;
~w4 = Window.new("Sampler 1", Rect(0, 484, 400, 80));
~w4.front;
~w4.alwaysOnTop_(true);


~startsamp1 = Button(~w4, Rect(370, 10, 18, 18)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, { ~samp1 = ~ps1.play }, { ~samp1.stop });
});

~samp1speed = Knob(~w4, Rect(350, 8, 20, 20)).action_({
	arg v;
	Pdefn(\sdur1, v.value + 0.01)
});

~samp1rate = Knob(~w4, Rect(350, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ratesamp1, v.value * 2)
});

~samp1amp= Knob(~w4, Rect(370, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ampsamp1, v.value * 5)
});

~sampsus1 = Slider(~w4, Rect(10, 10, 340, 20)).action_({
	arg v;
	Pdefn(\samp1sus, v.value + 0.001)
});

~samp1pos = Slider(~w4, Rect(10, 25, 340, 20)).action_({
	arg v;
	Pdefn(\spossamp1, (v.value * b.numFrames))
});

~reverse1 = Button(~w4, Rect(10, 50, 50, 20)).states_([
	["ReversOff", Color.black],
	["ReverseOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\ratesamp1, ~samp1rate.value * -3)}, {Pdefn(\ratesamp1, ~samp1rate.value * 3)})
});


~randspos1 = Button(~w4, Rect(65, 50, 50, 20)).states_([
	["RandposOff", Color.black],
	["RandposOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\spossamp1, Pwhite(0, b.numFrames))}, {Pdefn(\spossamp1, ~samp1pos.value * b.numFrames)})
});

~randpansamp1 = Button(~w4, Rect(120, 50, 50, 20)).states_([
	["RandpanOff", Color.black],
	["RandpanOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\pansamp1, Pwhite(-0.9, 0.9))}, {Pdefn(\pansamp1, 0)})
});

~randspeedsamp1 = Button(~w4, Rect(330, 50, 50, 20)).states_([
	["RandspeedOff", Color.black],
	["RandspeedOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\sdur1, Pwhite(0, ~samp1speed.value + 0.001))}, {Pdefn(\sdur1, ~samp1speed.value + 0.001)})
});

g = EZPopUpMenu.new(~w4, Rect(170, 50, 150, 20) ," Select : ");
g.addItem(\bell01, {b = Buffer.read(s, ~files ++ "bell01.wav");
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});
g.addItem(\voiture,{b = Buffer.read(s, ~files ++ "voitpont1.wav");
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});
g.addItem(\kick1, {b = Buffer.read(s, ~files ++ "kick01.wav");
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});
g.addItem(\background1, {b = Buffer.read(s,~files ++ "background01.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});
g.addItem(\clic1, {b = Buffer.read(s,~files ++ "cliqueti-001.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\clic2, {b = Buffer.read(s,~files ++ "cliqueti-002.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\clic3, {b = Buffer.read(s, ~files ++ "cliqueti-003.wav");
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\clic4, {b = Buffer.read(s,~files ++ "cliqueti-004.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\clochevache, {b = Buffer.read(s,~files ++ "clochevacheplastic.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\galet, {b = Buffer.read(s,~files ++ "galet.wav");
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\grillon, {b = Buffer.read(s,~files ++ "grillon.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\riviere, {b = Buffer.read(s,~files ++ "riviere.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

g.addItem(\snare01, {b = Buffer.read(s,~files ++ "snare01.wav" );
	Pdefn(\buf, Pdefn(\sample1, b.bufnum));
});

///////////////////Gui 2/////////////////////////////////


~w5 = Window.new("Sampler 2", Rect(400, 484, 400, 80));
~w5.front;
~w5.alwaysOnTop_(true);


~startsamp2 = Button(~w5, Rect(370, 10, 18, 18)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, { ~samp2 = ~ps2.play }, { ~samp2.stop });
});

~samp2speed = Knob(~w5, Rect(350, 8, 20, 20)).action_({
	arg v;
	Pdefn(\sdur2, v.value + 0.01)
});

~samp2rate = Knob(~w5, Rect(350, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ratesamp2, v.value * 2)
});

~samp2amp= Knob(~w5, Rect(370, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ampsamp2, v.value * 5)
});

~sampsus2 = Slider(~w5, Rect(10, 10, 340, 20)).action_({
	arg v;
	Pdefn(\samp2sus, v.value + 0.001)
});

~samp2pos = Slider(~w5, Rect(10, 25, 340, 20)).action_({
	arg v;
	Pdefn(\spossamp2, (v.value * ~b2.numFrames))
});

~reverse2 = Button(~w5, Rect(10, 50, 50, 20)).states_([
	["ReversOff", Color.black],
	["ReverseOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\ratesamp2, ~samp2rate.value * -3)}, {Pdefn(\ratesamp2, ~samp2rate.value * 3)})
});


~randspos2 = Button(~w5, Rect(65, 50, 50, 20)).states_([
	["RandposOff", Color.black],
	["RandposOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\spossamp2, Pwhite(0, ~b2.numFrames))}, {Pdefn(\spossamp2, ~samp2pos.value * ~b2.numFrames)})
});

~randpansamp2 = Button(~w5, Rect(120, 50, 50, 20)).states_([
	["RandpanOff", Color.black],
	["RandpanOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\pansamp2, Pwhite(-0.9, 0.9))}, {Pdefn(\pansamp2, 0)})
});

~randspeedsamp2 = Button(~w5, Rect(330, 50, 50, 20)).states_([
	["RandspeedOff", Color.black],
	["RandspeedOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\sdur2, Pwhite(0, ~samp2speed.value + 0.001))}, {Pdefn(\sdur2, ~samp2speed.value + 0.001)})
});

g = EZPopUpMenu.new(~w5, Rect(170, 50, 150, 20) ," Select : ");
g.addItem(\bell01, {~b2 = Buffer.read(s, ~files ++ "bell01.wav");
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});
g.addItem(\voiture,{~b2 = Buffer.read(s, ~files ++ "voitpont1.wav");
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});
g.addItem(\kick1, {~b2 = Buffer.read(s, ~files ++ "kick01.wav");
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});
g.addItem(\background1, {~b2 = Buffer.read(s,~files ++ "background01.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});
g.addItem(\clic1, {~b2 = Buffer.read(s,~files ++ "cliqueti-001.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\clic2, {~b2 = Buffer.read(s,~files ++ "cliqueti-002.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\clic3, {~b2 = Buffer.read(s, ~files ++ "cliqueti-003.wav");
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\clic4, {~b2 = Buffer.read(s, ~files ++ "cliqueti-004.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\clochevache, {~b2 = Buffer.read(s, ~files ++ "clochevacheplastic.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\galet, {~b2 = Buffer.read(s,~files ++ "galet.wav");
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\grillon, {~b2 = Buffer.read(s, ~files ++ "grillon.wav" );
	Pdefn(\buf2, Pdefn(\sample2,~b2.bufnum));
});

g.addItem(\riviere, {~b2 = Buffer.read(s,~files ++ "riviere.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});

g.addItem(\snare01, {~b2 = Buffer.read(s,~files ++ "snare01.wav" );
	Pdefn(\buf2, Pdefn(\sample2, ~b2.bufnum));
});


///////////////////Gui 3/////////////////////////////////


~w6 = Window.new("Sampler 3", Rect(0, 375, 400, 80));
~w6.front;
~w6.alwaysOnTop_(true);


~startsamp3 = Button(~w6, Rect(370, 10, 18, 18)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, { ~samp3 = ~ps3.play }, { ~samp3.stop });
});

~samp3speed = Knob(~w6, Rect(350, 8, 20, 20)).action_({
	arg v;
	Pdefn(\sdur3, v.value + 0.01)
});

~samp3rate = Knob(~w6, Rect(350, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ratesamp3, v.value * 2)
});

~samp3amp= Knob(~w6, Rect(370, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ampsamp3, v.value * 5)
});

~sampsus3 = Slider(~w6, Rect(10, 10, 340, 20)).action_({
	arg v;
	Pdefn(\samp3sus, v.value + 0.001)
});

~samp3pos = Slider(~w6, Rect(10, 25, 340, 20)).action_({
	arg v;
	Pdefn(\spossamp3, (v.value * ~b3.numFrames))
});

~reverse3 = Button(~w6, Rect(10, 50, 50, 20)).states_([
	["ReversOff", Color.black],
	["ReverseOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\ratesamp3, ~samp3rate.value * -3)}, {Pdefn(\ratesamp3, ~samp3rate.value * 3)})
});


~randspos3 = Button(~w6, Rect(65, 50, 50, 20)).states_([
	["RandposOff", Color.black],
	["RandposOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\spossamp3, Pwhite(0, ~b3.numFrames))}, {Pdefn(\spossamp3, ~samp3pos.value * ~b3.numFrames)})
});

~randpansamp3 = Button(~w6, Rect(120, 50, 50, 20)).states_([
	["RandpanOff", Color.black],
	["RandpanOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\pansamp3, Pwhite(-0.9, 0.9))}, {Pdefn(\pansamp3, 0)})
});

~randspeedsamp3 = Button(~w6, Rect(330, 50, 50, 20)).states_([
	["RandspeedOff", Color.black],
	["RandspeedOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\sdur3, Pwhite(0, ~samp3speed.value + 0.001))}, {Pdefn(\sdur3, ~samp3speed.value + 0.001)})
});

g = EZPopUpMenu.new(~w6, Rect(170, 50, 150, 20) ," Select : ");
g.addItem(\bell01, {~b3 = Buffer.read(s, ~files ++ "bell01.wav");
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});
g.addItem(\voiture,{~b3 = Buffer.read(s, ~files ++ "voitpont1.wav");
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});
g.addItem(\kick1, {~b3 = Buffer.read(s, ~files ++ "kick01.wav");
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});
g.addItem(\background1, {~b3 = Buffer.read(s, ~files ++ "background01.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});
g.addItem(\clic1, {~b3 = Buffer.read(s, ~files ++ "cliqueti-001.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\clic2, {~b3 = Buffer.read(s, ~files ++ "cliqueti-002.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\clic3, {~b3 = Buffer.read(s, ~files ++ "cliqueti-003.wav");
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\clic4, {~b3 = Buffer.read(s, ~files ++ "cliqueti-004.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\clochevache, {~b3 = Buffer.read(s, ~files ++ "clochevacheplastic.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\galet, {~b3 = Buffer.read(s, ~files ++ "galet.wav");
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\grillon, {~b3 = Buffer.read(s, ~files ++ "grillon.wav" );
	Pdefn(\buf3, Pdefn(\sample3,~b3.bufnum));
});

g.addItem(\riviere, {~b3 = Buffer.read(s, ~files ++ "riviere.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});

g.addItem(\snare01, {~b3 = Buffer.read(s, ~files ++ "snare01.wav" );
	Pdefn(\buf3, Pdefn(\sample3, ~b3.bufnum));
});



///////////////////Gui 4/////////////////////////////////


~w7 = Window.new("Sampler 4", Rect(400, 375, 400, 80));
~w7.front;
~w7.alwaysOnTop_(true);


~startsamp4 = Button(~w7, Rect(370, 10, 18, 18)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, { ~samp4 = ~ps4.play }, { ~samp4.stop });
});

~samp4speed = Knob(~w7, Rect(350, 8, 20, 20)).action_({
	arg v;
	Pdefn(\sdur4, v.value + 0.01)
});

~samp4rate = Knob(~w7, Rect(350, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ratesamp4, v.value * 2)
});

~samp4amp= Knob(~w7, Rect(370, 28, 20, 20)).action_({
	arg v;
	Pdefn(\ampsamp4, v.value * 5)
});

~sampsus4 = Slider(~w7, Rect(10, 10, 340, 20)).action_({
	arg v;
	Pdefn(\samp4sus, v.value + 0.001)
});

~samp4pos = Slider(~w7, Rect(10, 25, 340, 20)).action_({
	arg v;
	Pdefn(\spossamp4, (v.value * ~b4.numFrames))
});

~reverse4 = Button(~w7, Rect(10, 50, 50, 20)).states_([
	["ReversOff", Color.black],
	["ReverseOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\ratesamp4, ~samp4rate.value * -3)}, {Pdefn(\ratesamp4, ~samp4rate.value * 3)})
});


~randspos4 = Button(~w7, Rect(65, 50, 50, 20)).states_([
	["RandposOff", Color.black],
	["RandposOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\spossamp4, Pwhite(0, ~b4.numFrames))}, {Pdefn(\spossamp4, ~samp4pos.value * ~b4.numFrames)})
});

~randpansamp4 = Button(~w7, Rect(120, 50, 50, 20)).states_([
	["RandpanOff", Color.black],
	["RandpanOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\pansamp4, Pwhite(-0.9, 0.9))}, {Pdefn(\pansamp4, 0)})
});

~randspeedsamp4 = Button(~w7, Rect(330, 50, 50, 20)).states_([
	["RandspeedOff", Color.black],
	["RandspeedOn", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\sdur4, Pwhite(0, ~samp4speed.value + 0.001))}, {Pdefn(\sdur4, ~samp4speed.value + 0.001)})
});

g = EZPopUpMenu.new(~w7, Rect(170, 50, 150, 20) ," Select : ");
g.addItem(\bell01, {~b4 = Buffer.read(s, ~files ++ "bell01.wav");
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});
g.addItem(\voiture,{~b4 = Buffer.read(s, ~files ++ "voitpont1.wav");
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});
g.addItem(\kick1, {~b4 = Buffer.read(s, ~files ++ "kick01.wav");
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});
g.addItem(\background1, {~b4 = Buffer.read(s, ~files ++ "background01.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});
g.addItem(\clic1, {~b4 = Buffer.read(s,~files ++ "cliqueti-001.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\clic2, {~b4 = Buffer.read(s,~files ++ "cliqueti-002.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\clic3, {~b4 = Buffer.read(s, ~files ++ "cliqueti-003.wav");
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\clic4, {~b4 = Buffer.read(s, ~files ++ "cliqueti-004.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\clochevache, {~b4 = Buffer.read(s, ~files ++ "clochevacheplastic.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\galet, {~b4 = Buffer.read(s, ~files ++ "galet.wav");
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\grillon, {~b4 = Buffer.read(s, ~files ++ "grillon.wav" );
	Pdefn(\buf4, Pdefn(\sample4,~b4.bufnum));
});

g.addItem(\riviere, {~b4 = Buffer.read(s, ~files ++ "riviere.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});

g.addItem(\snare01, {~b4 = Buffer.read(s, ~files ++ "snare01.wav" );
	Pdefn(\buf4, Pdefn(\sample4, ~b4.bufnum));
});




//////////////////// GUI Noise 1 ///////////////////////

w = Window.new("synthnoise", Rect(-8, 625, 600, 240));
w.alwaysOnTop_(true);
w.front;


~startbtn = Button(w, Rect( 330, 20, 50, 30)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]
]).action_({
	arg v;
	if ( v.value == 1, { ~noise = p.play}, {~noise.stop}) ;
});



~panbtn = Button(w, Rect( 330, 50, 50, 30)).states_([
	["Panoff", Color.black],
	["Randpan", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\synthpan, Pwhite(-1.0, 1.0))}, {Pdefn(\synthpan, 0)});
});



~timerange = RangeSlider(w, Rect( 20, 20, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthtime, Pwhite(v.lo, v.hi));
});

~durange = RangeSlider(w, Rect( 20, 50, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthdur, Pwhite(v.lo, v.hi));
});

~amp1 = Slider(w, Rect(20, 110, 300, 30))
.action_({
	arg v;
	Pdefn(\amp, (v.value * 1.5));
});

~freq1 = Slider(w, Rect(390, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq1, (v.value * 11120)+ 500);
});

~q1 = Knob(w, Rect(340, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q1, v.value * 0.4);
});

~bmul1 = Knob(w, Rect(340, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul1, v.value * 500);
});


~freq2 = Slider(w, Rect(480, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq2, (v.value * 11120)+ 500);
});

~q2 = Knob(w, Rect(430, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q2, v.value * 0.4);
});

~bmul2 = Knob(w, Rect(430, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul2, v.value * 500);
});


////////////////////////////// GUI NOISE 2 ////////////////////////

~w2 = Window.new("synthnoise2", Rect(592, 625, 600, 240));
~w2.alwaysOnTop_(true);
~w2.front;


~startbtn2 = Button(~w2, Rect( 330, 20, 50, 30)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]
]).action_({
	arg v;
	if ( v.value == 1, { ~noise2 = ~p2.play}, {~noise2.stop}) ;
});



~panbtn2 = Button(~w2, Rect( 330, 50, 50, 30)).states_([
	["Panoff", Color.black],
	["Randpan", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\synthpan2, Pwhite(-1.0, 1.0))}, {Pdefn(\synthpan2, 0)});
});



~timerange2 = RangeSlider(~w2, Rect( 20, 20, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthtime2, Pwhite(v.lo, v.hi));
});

~durange2 = RangeSlider(~w2, Rect( 20, 50, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthdur2, Pwhite(v.lo, v.hi));
});

~amp2 = Slider(~w2, Rect(20, 110, 300, 30))
.action_({
	arg v;
	Pdefn(\amp2, (v.value * 1.5));
});


~freq12 = Slider(~w2, Rect(390, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq12, (v.value * 11120)+ 500);
});

~q12 = Knob(~w2, Rect(340, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q12, v.value * 0.4);
});

~bmul12 = Knob(~w2, Rect(340, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul12, v.value * 500);
});


~freq22 = Slider(~w2, Rect(480, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq22, (v.value * 11120)+ 500);
});

~q22 = Knob(~w2, Rect(430, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q22, v.value * 0.4);
});

~bmul22 = Knob(~w2, Rect(430, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul22, v.value * 500);
});


////////////////////////////// GUI NOISE 3 ////////////////////////

~w3 = Window.new("synthnoise3", Rect(798, 355, 600, 240));
~w3.alwaysOnTop_(true);
~w3.front;


~startbtn3 = Button(~w3, Rect( 330, 20, 50, 30)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]
]).action_({
	arg v;
	if ( v.value == 1, { ~noise3 = ~p3.play}, {~noise3.stop}) ;
});



~panbtn3 = Button(~w3, Rect( 330, 50, 50, 30)).states_([
	["Panoff", Color.black],
	["Randpan", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\synthpan3, Pwhite(-1.0, 1.0))}, {Pdefn(\synthpan3, 0)});
});



~timerange3 = RangeSlider(~w3, Rect( 20, 20, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthtime3, Pwhite(v.lo, v.hi));
});

~durange3 = RangeSlider(~w3, Rect( 20, 50, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthdur3, Pwhite(v.lo, v.hi));
});

~amp3 = Slider(~w3, Rect(20, 110, 300, 30))
.action_({
	arg v;
	Pdefn(\amp3, (v.value * 1.5));
});


~freq13 = Slider(~w3, Rect(390, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq13, (v.value * 500)+ 10);
});

~q13 = Knob(~w3, Rect(340, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q13, v.value * 0.4);
});

~bmul13 = Knob(~w3, Rect(340, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul13, v.value * 500);
});


~freq23 = Slider(~w3, Rect(480, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq23, (v.value * 500)+ 10);
});

~q23 = Knob(~w3, Rect(430, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q23, v.value * 0.4);
});

~bmul23 = Knob(~w3, Rect(430, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul23, v.value * 500);
});



////////////////////////////// GUI NOISE 4 ////////////////////////

~w4 = Window.new("synthnoise4", Rect(798, 100, 600, 240));
~w4.alwaysOnTop_(true);
~w4.front;


~startbtn4 = Button(~w4, Rect( 330, 20, 50, 30)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]
]).action_({
	arg v;
	if ( v.value == 1, { ~noise4 = ~p4.play}, {~noise4.stop}) ;
});



~panbtn4 = Button(~w4, Rect( 330, 50, 50, 30)).states_([
	["Panoff", Color.black],
	["Randpan", Color.white, Color.black]])
.action_({
	arg v;
	if (v.value == 1, {Pdefn(\synthpan4, Pwhite(-1.0, 1.0))}, {Pdefn(\synthpan4, 0)});
});



~timerange4 = RangeSlider(~w4, Rect( 20, 20, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthtime4, Pwhite(v.lo, v.hi));
});

~durange4 = RangeSlider(~w4, Rect( 20, 50, 300, 30)).hi_(1).lo_(0)
.action_({
	arg v;
	Pdefn(\synthdur4, Pwhite(v.lo, v.hi));
});

~amp4 = Slider(~w4, Rect(20, 110, 300, 30))
.action_({
	arg v;
	Pdefn(\amp4, (v.value * 1.5));
});


~freq14 = Slider(~w4, Rect(390, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq14, (v.value * 500)+ 10);
});

~q14 = Knob(~w4, Rect(340, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q14, v.value * 0.4);
});

~bmul14 = Knob(~w4, Rect(340, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul14, v.value * 500);
});


~freq24 = Slider(~w4, Rect(480, 20, 30, 200))
.action_({
	arg v;
	Pdefn(\freq24, (v.value * 500)+ 10);
});

~q24 = Knob(~w4, Rect(430, 90, 40, 40)).action_({
	arg v;
	Pdefn(\q24, v.value * 0.4);
});

~bmul24 = Knob(~w4, Rect(430, 140, 40, 40)).action_({
	arg v;
	Pdefn(\bmul24, v.value * 500);
});



//////////////// GUI Couic ////////////////////

~w9 = Window.new("couic", Rect(600, 245, 200, 100)).front.alwaysOnTop_(true);


~startcouic = Button.new(~w9, Rect(160, 10, 30, 30)).states_([
	["off", Color.black],
	["on", Color.white, Color.black]]).action_({
	arg v;
	if (v.value == 1, { ~couic = Synth.new(\couic, [
		\car, (~slidecar.value * 70) + 5, \bfreq, (~slidefreq.value * 3000) + 10,  \bw, (~slideq.value * 10) + 0.01, \bmul, ~knobamp.value * 10]).register;
	},
	{ ~couic.free});
});


~slidecar = Slider.new(~w9, Rect(5, 10, 140, 20))
.action_({
	arg v;
	if (~couic.isPlaying, {~couic.set(\car, ((v.value * 70) + 5))});
});

~slideq = Slider.new(~w9, Rect(5, 35, 140, 20))
.action_({
	arg v;
	if (~couic.isPlaying, {~couic.set(\bw, ((v.value * 10) + 0.001))});
});

~slidefreq = Slider.new(~w9, Rect(5, 60, 140, 20))
.action_({
	arg v;
	if (~couic.isPlaying, {~couic.set(\bfreq, (v.value * 3000) + 10)});
});

~knobamp = Knob.new(~w9, Rect(160, 45, 30, 30))
.action_({
	arg v;
	if (~couic.isPlaying, {~couic.set(\bmul, v.value * 10)});
});


///////////////////////////// MIDI /////////////////////////////

MIDIIn.connectAll;



MIDIdef.noteOn(\startsamp1, {
	arg v;
	defer {if ( v.value > 0, {~startsamp1.valueAction_(1 - ~startsamp1.value)})};
}, 35, 1);

MIDIdef.noteOn(\startsamp12, {
	arg v;
	defer {if ( v.value > 0, {~startsamp1.valueAction_(1 - ~startsamp1.value)})};
}, 36, 3);

MIDIdef.noteOn(\randpansamp1, {
	arg v;
	defer {if ( v.value > 0, {~randpansamp1.valueAction_(1 - ~randpansamp1.value)})};
}, 37, 1);

MIDIdef.noteOn(\randpos1, {
	arg v;
	defer {if ( v.value > 0, {~randspos1.valueAction_(1 - ~randspos1.value)})};
}, 36, 1);

MIDIdef.noteOn(\reverse1, {
	arg v;
	defer {if ( v.value > 0, {~reverse1.valueAction_(1 - ~reverse1.value)})};
}, 38, 1);

MIDIdef.cc(\sampsus1, {
	arg v ;
	defer { ~sampsus1.valueAction_((v.value/127))};
}, 1, 1);

MIDIdef.cc(\samp1rate, {
	arg v ;
	defer { ~samp1rate.valueAction_((v.value/127))};
}, 5, 1);

MIDIdef.cc(\samp1speed, {
	arg v ;
	defer { ~samp1speed.valueAction_((v.value/127))};
}, 2, 1);

MIDIdef.cc(\samp1amp, {
	arg v ;
	defer { ~samp1amp.valueAction_((v.value/127))};
}, 6, 1);

MIDIdef.cc(\samp12amp, {
	arg v ;
	defer { ~samp1amp.valueAction_((v.value/127))};
}, 5, 3);


//////////// SAMP2///////////

MIDIdef.noteOn(\startsamp2, {
	arg v;
	defer {if ( v.value > 0, {~startsamp2.valueAction_(1 - ~startsamp2.value)})};
}, 42, 1);

MIDIdef.noteOn(\startsamp22, {
	arg v;
	defer {if ( v.value > 0, {~startsamp2.valueAction_(1 - ~startsamp2.value)})};
}, 38, 3);

MIDIdef.noteOn(\randpansamp2, {
	arg v;
	defer {if ( v.value > 0, {~randpansamp2.valueAction_(1 - ~randpansamp2.value)})};
}, 46, 1);

MIDIdef.noteOn(\randpos2, {
	arg v;
	defer {if ( v.value > 0, {~randspos2.valueAction_(1 - ~randspos2.value)})};
}, 39, 1);

MIDIdef.noteOn(\reverse2, {
	arg v;
	defer {if ( v.value > 0, {~reverse2.valueAction_(1 - ~reverse2.value)})};
}, 44, 1);

MIDIdef.cc(\sampsus2, {
	arg v ;
	defer { ~sampsus2.valueAction_((v.value/127))};
}, 3, 1);

MIDIdef.cc(\samp2rate, {
	arg v ;
	defer { ~samp2rate.valueAction_((v.value/127))};
}, 7, 1);

MIDIdef.cc(\samp2speed, {
	arg v ;
	defer { ~samp2speed.valueAction_((v.value/127))};
}, 4, 1);

MIDIdef.cc(\samp2amp, {
	arg v ;
	defer { ~samp2amp.valueAction_((v.value/127))};
}, 8, 1);

MIDIdef.cc(\samp22amp, {
	arg v ;
	defer { ~samp2amp.valueAction_((v.value/127))};
}, 6, 3);

//////////// SAMP3///////////

MIDIdef.noteOn(\startsamp3, {
	arg v;
	defer {if ( v.value > 0, {~startsamp3.valueAction_(1 - ~startsamp3.value)})};
}, 60, 2);

MIDIdef.noteOn(\startsamp32, {
	arg v;
	defer {if ( v.value > 0, {~startsamp3.valueAction_(1 - ~startsamp3.value)})};
}, 40, 3);

MIDIdef.noteOn(\randpansamp3, {
	arg v;
	defer {if ( v.value > 0, {~randpansamp3.valueAction_(1 - ~randpansamp3.value)})};
}, 67, 2);

MIDIdef.noteOn(\randpos3, {
	arg v;
	defer {if ( v.value > 0, {~randspos3.valueAction_(1 - ~randspos3.value)})};
}, 62, 2);

MIDIdef.noteOn(\reverse3, {
	arg v;
	defer {if ( v.value > 0, {~reverse3.valueAction_(1 - ~reverse3.value)})};
}, 69, 2);

MIDIdef.cc(\sampsus3, {
	arg v ;
	defer { ~sampsus3.valueAction_((v.value/127))};
}, 1, 2);

MIDIdef.cc(\samp3rate, {
	arg v ;
	defer { ~samp3rate.valueAction_((v.value/127))};
}, 5, 2);

MIDIdef.cc(\samp3speed, {
	arg v ;
	defer { ~samp3speed.valueAction_((v.value/127))};
}, 2, 2);

MIDIdef.cc(\samp3amp, {
	arg v ;
	defer { ~samp3amp.valueAction_((v.value/127))};
}, 6, 2);

MIDIdef.cc(\samp32amp, {
	arg v ;
	defer { ~samp3amp.valueAction_((v.value/127))};
}, 7, 3);


//////////// SAMP4///////////

MIDIdef.noteOn(\startsamp4, {
	arg v;
	defer {if ( v.value > 0, {~startsamp4.valueAction_(1 - ~startsamp4.value)})};
}, 64, 2);

MIDIdef.noteOn(\startsamp42, {
	arg v;
	defer {if ( v.value > 0, {~startsamp4.valueAction_(1 - ~startsamp4.value)})};
}, 41, 3);

MIDIdef.noteOn(\randpansamp4, {
	arg v;
	defer {if ( v.value > 0, {~randpansamp4.valueAction_(1 - ~randpansamp4.value)})};
}, 71, 2);

MIDIdef.noteOn(\randpos4, {
	arg v;
	defer {if ( v.value > 0, {~randspos4.valueAction_(1 - ~randspos4.value)})};
}, 65, 2);

MIDIdef.noteOn(\reverse4, {
	arg v;
	defer {if ( v.value > 0, {~reverse4.valueAction_(1 - ~reverse4.value)})};
}, 72, 2);

MIDIdef.cc(\sampsus4, {
	arg v ;
	defer { ~sampsus4.valueAction_((v.value/127))};
}, 3, 2);

MIDIdef.cc(\samp4rate, {
	arg v ;
	defer { ~samp4rate.valueAction_((v.value/127))};
}, 7, 2);

MIDIdef.cc(\samp4speed, {
	arg v ;
	defer { ~samp4speed.valueAction_((v.value/127))};
}, 4, 2);

MIDIdef.cc(\samp4amp, {
	arg v ;
	defer { ~samp4amp.valueAction_((v.value/127))};
}, 8, 2);

MIDIdef.cc(\samp42amp, {
	arg v ;
	defer { ~samp4amp.valueAction_((v.value/127))};
}, 8, 3);


//////////////// Noise 1 ///////////////


MIDIdef.noteOn(\start1,
	{arg v;
		defer {if (v > 0, {~startbtn.valueAction_(1 - ~startbtn.value)})};


}, 36, 0);

MIDIdef.noteOn(\start12,
	{arg v;
		defer {if (v > 0, {~startbtn.valueAction_(1 - ~startbtn.value)})};


}, 43, 3);

MIDIdef.noteOn(\pan1,
	{arg v;
		defer {if (v > 0, {~panbtn.valueAction_(1 - ~panbtn.value)})};


}, 40, 0);

MIDIdef.cc( \freq1, {arg v;

{~freq1.valueAction_((v/127))}.defer;

		}, 1, 0);

MIDIdef.cc( \freq2, {arg v;

{~freq2.valueAction_((v/127))}.defer;

		}, 2, 0);

MIDIdef.cc( \q1, {arg v;

{~q1.valueAction_((v/127))}.defer;

		}, 5, 0);


MIDIdef.cc( \q2, {arg v;

{~q2.valueAction_((v/127))}.defer;

		}, 6, 0);

MIDIdef.cc(\amp1, {arg v;
	{~amp1.valueAction_((v/127))}.defer;
}, 1, 3);


///////////////////////// Noise 2 //////////////////////

MIDIdef.noteOn(\start2,
	{arg v;
		defer {if (v > 0, {~startbtn2.valueAction_(1 - ~startbtn2.value)})};


}, 37, 0);

MIDIdef.noteOn(\start22,
	{arg v;
		defer {if (v > 0, {~startbtn2.valueAction_(1 - ~startbtn2.value)})};


}, 45, 3);

MIDIdef.noteOn(\pan2,
	{arg v;
		defer {if (v > 0, {~panbtn2.valueAction_(1 - ~panbtn2.value)})};

}, 41, 0);

MIDIdef.cc( \freq12, {arg v;

{~freq12.valueAction_((v/127))}.defer;

		}, 3, 0);

MIDIdef.cc( \freq22, {arg v;

{~freq22.valueAction_((v/127))}.defer;

		}, 4, 0);

MIDIdef.cc( \q12, {arg v;

{~q12.valueAction_((v/127))}.defer;

		}, 7, 0);


MIDIdef.cc( \q22, {arg v;

{~q22.valueAction_((v/127))}.defer;

		}, 8, 0);

MIDIdef.cc(\amp2, {arg v;
	{~amp2.valueAction_((v/127))}.defer;
}, 2, 3);



///////////////////////// Noise 3 //////////////////////


MIDIdef.noteOn(\start3,
	{arg v;
		defer {if (v > 0, {~startbtn3.valueAction_(1 - ~startbtn3.value)})};
}, 38, 0);



MIDIdef.noteOn(\start32,
	{arg v;
		defer {if (v > 0, {~startbtn3.valueAction_(1 - ~startbtn3.value)})};


}, 47, 3);

MIDIdef.noteOn(\pan3,
	{arg v;
		defer {if (v > 0, {~panbtn3.valueAction_(1 - ~panbtn3.value)})};
}, 42, 0);

MIDIdef.cc(\amp3, {arg v;
	{~amp3.valueAction_((v/127))}.defer;
}, 3, 3);

///////////////////////// Noise 4 //////////////////////


MIDIdef.noteOn(\start4,
	{arg v;
		defer {if (v > 0, {~startbtn4.valueAction_(1 - ~startbtn4.value)})};
}, 39, 0);



MIDIdef.noteOn(\start42,
	{arg v;
		defer {if (v > 0, {~startbtn4.valueAction_(1 - ~startbtn4.value)})};


}, 48, 3);

MIDIdef.noteOn(\pan4,
	{arg v;
		defer {if (v > 0, {~panbtn4.valueAction_(1 - ~panbtn4.value)})};
}, 43, 0);

MIDIdef.cc(\amp4, {arg v;
	{~amp4.valueAction_((v/127))}.defer;
}, 4, 3);
)

MIDIIn.connectAll;
MIDIFunc.trace(true);