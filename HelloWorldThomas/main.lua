-----------------------------------------------------------------------------------------
-- Name:Thomas Wehbi
-- Couse: ICS20/3C
-- This program displays Hello, World on the ipad simulator and "Hellooooooo!" to the command
-- terminal.
-- main.lua
--
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Helloooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

--------------------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------------------
-- Correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3") -- setting a variable an mp3 file 
local correctSoundChannel1

-- Wrong sound
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3") -- setting a variable an mp3 file 
local wrongSoundChannel1

-- create local variable 
local textObject

-- displays text on the screen at position x = 500 and y = 500 with 
-- a deafult font style and font size of 50
textObject = display.newText( "Hello, World!" , 300, 400, nil, 75 )

-- sets the color of the text
textObject:setTextColor()

-- create local variable 
local textObject2

-- displays text on the screen at position x = 500 and y = 500 with 
-- a deafult font style and font size of 50
textObject2 = display.newText( "By Thomas Wehbi" , 400, 500, nil, 75)

correctSoundChannel1 = audio.play(correctSound)
wrongSoundChannel1 = audio.play(wrongSound)