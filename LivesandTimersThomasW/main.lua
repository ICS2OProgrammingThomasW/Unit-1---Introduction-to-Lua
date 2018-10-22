-----------------------------------------------------------------------------------------
-- variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2


------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------

local function UpdateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft -1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 )then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives -1

	-- IF THERE ARE NO LIVES LEFT, PLAY A LOOSE SOUND, SHOW A LOOSE IMAGE AND CACEL THE TIMER
	-- REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
	if (lives == 2) then
		heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end

	local function AskQuestion()

	end
end 


-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.preformWithDelay( 1000, UpdateTime, 0)
end

-------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------

-- create the lives to display on the screen 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7 

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2 = display.contentWidth * 6 / 8
heart2 = display.contentHeight * 1 / 7
