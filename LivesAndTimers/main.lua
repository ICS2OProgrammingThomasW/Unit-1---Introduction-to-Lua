-----------------------------------------------------------------------------------------
-- Title:Lives and Timers
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Description: in this program there will be a timer that counts down from 10 seconds, and 
-- you have 10 seconds to answer a question. If you don't answer the question in time 
-- you loose a life, you have 4 lifes.


-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background color 
display.setDefault("background", 100/255, 150/255, 190/255)


------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------

-- create local variables
local questionObject

local correctObject
local wrongObject

local numericField

local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator

local pointsTextObject
local points = 0

local lives = 4
local heart1
local heart2
local heart3
local heart4

-- variables for the timer
local totalSeconds = 10
local secondsLeft = totalSeconds
local clockText
local countDownTimer

-- local Incorrect Object
-- local Points Object
-- local Points

----------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to an mp3 file
local correctSoundChannel

-- Wrong sound
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3" ) -- Setting a variable to an mp3 file
local wrongSoundChannel


------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------

local  function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 =  math.random(0, 10)
	randomNumber2 =  math.random(0, 10)
	randomOperator = math.random(1, 3)

	-- handle the case for addition
	if (randomOperator == 1) then

		-- calculate the correct answer
	   correctAnswer = randomNumber1 + randomNumber2 

	   	-- display the question to the user
	 	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

		-- handle the case for subtraction
	elseif (randomOperator == 2) then
 		correctAnswer = randomNumber1 - randomNumber2 
		-- display the question to the user 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	 	-- handle the case for addition
	elseif (randomOperator == 3) then
 		correctAnswer = randomNumber1 * randomNumber2 
		-- display the question to the user
	 	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end
end
	 

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end


local function HideWrong()
	wrongObject.isVisible = false 
	AskQuestion()
end

		-- function that decreases the lives
local function DecreaseLives()
	
	if (secondsLeft == 0) then
		lives = lives -1
	end

	if (lives == 4) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = true
		heart4.isVisible = true

	elseif (lives == 3) then
		heart1.isVisible = false
		heart2.isVisible = true
		heart3.isVisible = true
		heart4.isVisible = true
	
	elseif (lives == 2) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = true
		heart4.isVisible = true

	elseif (lives == 1) then 
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		heart4.isVisible = true

	elseif (lives == 0) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		heart4.isVisible = false
		gameOver.alpha = 1
		totalSeconds = 0
		numericField:removeSelf()
 	
 	end

 -- call the function to ask a new question
 	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""
	
	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			
			timer.performWithDelay(2000, HideCorrect)
			points = points +1

			correctSoundChannel = audio.play(correctSound)

			-- For each answer you get correct your points increase
			pointsTextObject.text = "points = " .. points 
		
			-- if the users answer and the correct answer are the same:
		else 
			-- call the funcion to decrease the lives
			lives = lives -1
			DecreaseLives()
			wrongObject.isVisible = true			
			timer.performWithDelay(2000, HideWrong)
			wrongSoundChannel = audio.play(wrongSound)
		end
		event.target.text = ""
	end
end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

<<<<<<< HEAD
	if  (secondsLeft == 0) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
	elseif (totalSeconds == 0) then
		lives = lives -1
		
	end
end
=======
	if (secondsLeft == 0) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives -1
		DecreaseLives(lives)
	end
end 
>>>>>>> 2675145606be7c1071c5927baf9a0e358f3a6824

-- function that calls the timer
local function StartTimer()

-- create a countdown timer that loops infinitely
 	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

-- create a points box make it visible to see
pointsTextObject = display.newText(" points = " .. points, 300, 200, nil, 50 )
pointsTextObject:setTextColor(150/255, 250/255, 150/255)

----------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------

-- displays a question and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

wrongObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
wrongObject:setTextColor(155/255, 42/255, 198/255)
wrongObject.isVisible = false

clockText = display.newText(" Time Remaining = " .. secondsLeft, 412, 300, nil, 50)
-- Function Calls 

gameOver = display.newImageRect("Images/gameOver.png", 800 ,800)
gameOver.x = display.contentCenterX
gameOver.y = display.contentCenterY
gameOver.alpha = 0

-- create the lives to display on the screen 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

-- create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)

--the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

--------------------------------------------------------------------------
-- FUNCTION CALLS 
--------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

StartTimer()




