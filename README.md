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