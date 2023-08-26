# EdgeTxExamples

Examples of models, logic, and radio settings for EdgeTX

This repo focused on the model settings and the related files, so it has all the model needs, including its image, callouts and scripts.
The folder structure is the same as on a radio, so it's clear where to put the files.

Additionally, it has *RadioParams.etx* file, which you can open in Companion 2.8 and explore.


## How to use the models

I used these models with my Radiomaster TX16S.

To import these models to your radio, please see this video: [EdgeTX 2.8+ Sharing Model Files Between Radios](https://www.youtube.com/watch?v=UluXnZNJzSE).


## Models

### 1 - Simulator

I mainly use this model with Heli-X, but it works with others too.

Nothing special - I'm just collecting all I can in the inputs and mixing all of that to channels. When you connect radio to your PC, you map these channels to the functions you need in sim. There's a mapping for Heli-X available [here](#rmtx16sjoystickxml).


### 2 - OMPHobby M2 V2

It has quite a lot of logic and functions.

**First** - it has arming sequence, to activate the motor you need to set pitch at neutral, move ail/ele stick to the bottom left corner, and then you can activate the motor.

This sequence protects well against accidental activation, but also quite convenient and reliable (it will not cut you off in flight, see the description for that piece of logic below).

Inspired by this video from [RcVideoReviews](https://www.youtube.com/watch?v=buqQNZVoUXQ)

**Second** - it has a quite accurate flight counter - it counts not just the fact that you turned on the motor. It counts a flight, only if we started with charged battery, working telemetry, and during this session the voltage got below a certain threshold.

This counter is very useful to track your own progress and how well the heli parts last.

**Third** - It will reset the flight timers and preflight checks when you finished your flight and disconnected the battery for more than 10 seconds.

This is the description of **logical switches**, hope it'll help to understand the logic:

- L01 - Model turned on for the first time, we can start writing logs
- L03 - Low voltage detection. Active only when armed.

Flight counter block
- L06 - Telemetry is ON and battery is full
- L07 - Model is flying - telemetry ON and MotorOn. SD not always mean that the motor is ON because throttle may be locked, but it's fine in that case
- L08 - Model is flying and voltage got lower
- L09 - Represents flight. Starts when battery is full, ends when battery got lower during active usage
- L10 - Activates when sticky "flight" switch turns ON and then turns OFF (V2 part 2 set to release/infinite)

Arming sequence block
- L13 - Pitch is near neutral position
- L14 - Aileron is left and SD is down
- L15 - Elevator is down and previous switch is ON. Stays ON for 5 seconds
- L16 - Motor started - pitch neutral, previous switch is still ON
- L17 - Motor off for 10 seconds
- L18 - Permission to use the motor without going through sequence again. Starts after the first successful spoolup, ends when motor is off for 10 seconds.

Motor state indicators
- L22 - for MotorOn. Fires only when the throttle is unlocked.

Auto-reset block
- L24 - if we were used motor more than time T
- L25 - we remember, that we used the motor more than time T
- L26 - if 10 seconds passed since telemetry loss after we used the motor more than time T

Rescue function. For M2 it's auto-level and positive pitch:
- L28 - Activates 0.3 sec after RescueOn, turns off after 0.6. Represents how much time pitch should be positive, used in mixes.


### 3 - SAB RAW 580

I share most of my logic between my models, so please see the description for M2.

Again here are the logical switches, the same blocks as before:

- L01 - Model turned on for the first time, we can start writing logs
- L03 - Low voltage detection. Will fire if voltage is below the threshold for 0.5sec. Active only when armed.
- L04 - Low battery detection. Active only when armed.

Flight counter block

- L06 - Telemetry is ON and battery is full
- L07 - Model is flying - telemetry ON and MotorOn. SD not always mean that the motor is ON because throttle may be locked, but it's fine in that case
- L08 - Model is flying and voltage got lower
- L09 - Represents flight. Starts when battery is full, ends when battery got lower during active usage
- L10 - Activates when sticky "flight" switch turns ON and then turns OFF (V2 part 2 set to release/infinite)

Arming sequence block
- L13 - Pitch is near neutral position
- L14 - Aileron is left and SD is down
- L15 - Elevator is down and previous switch is ON. Stays ON for 5 seconds
- L16 - Motor started - pitch neutral, previous switch is still ON
- L17 - Motor off for 10 seconds
- L18 - Permission to use the motor without going through sequence again. Starts after the first successful spoolup, ends when motor is off for 10 seconds.

Motor state indicators
- L20 - for autorotation mode. Fires only when the throttle is unlocked.
- L21 - autorotation turned on more than 20 seconds.
- L22 - for MotorOn. Fires only when the throttle is unlocked.

Auto-reset block
- L24 - if we were used motor more than time T
- L25 - we remember, that we used the motor more than time T
- L26 - if 10 seconds passed since telemetry loss after we used the motor more than time T


### 4 - Races
Sometimes I play video games like Revolt with my son - why not play with the joystick :D

The right stick controls forward/reverse/left/right and trims serve as a good momentary buttons. There's no logic but please see `Special Functions` to see how I did trim overrides.

Please also note that trims are disabled on the `Flight Modes` tab.


## Extras

### Scripts/Functions/LogMy.lua

The logging script writes selected logical switches as telemetry values, so you can track them in the Log Viewers in radio and the Companion.

More info [here](https://www.rcgroups.com/forums/showpost.php?p=47987693&postcount=2073) and [here](https://www.rcgroups.com/forums/showpost.php?p=47996993&postcount=6837).


### RMTX16SJoystick.xml

That is a configuration file for Heli-X. To use it:
- download the file
- open `Heli-X -> Configuration -> Controller -> Load`
- select that file.

Heli-X keeps these configurations in the folder `c:\ProgramData\HELI-X10\files\controller\`.


### Themes/EdgeTX/background.png

Background with more calm colors to reduce visual noise and make it easier to read labels.