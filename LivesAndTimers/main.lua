-----------------------------------------------------------------------------------------
-- Title:Lives and Timers
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Description: in this program there will be a timer that counts down from 10 seconds, and 
-- you have 10 seconds to answer a question. If you don't answer the question in time 
-- you loose a life, you have 4 lifes.


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- variables for the timer
local totalSeconds = 5 
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

local Incorrect Object
local Points Object
local Points\

--------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft -1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds 
		lives = lives -1

		if  (lives == 2) then 
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end
 			AskQuestion()
 		end
 	end 

 	-- function that calls the timer
 	local function StartTimer()
 	--




