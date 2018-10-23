-----------------------------------------------------------------------------------------
-- Title:
-- Name:
-- Course:
-- This program displays a math question and asks the user to answer in a numeric textField.
-- terminal.


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
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local wrongAnswer
local randonOperator
local pointsTextObject
local points = 0

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


	local function HideIncorrect()
		correctObject.isVisible = false 
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
			wrongObject.isVisible = false
			event.target.text = ""
			timer.performWithDelay(2000, HideCorrect)
			points = points +1
			correctSoundChannel = audio.play(correctSound)

			-- For each answer you get correct your points increase
			pointsTextObject.text = "points = " .. points 
		
			-- if the users answer and the correct answer are the same:
		else 
			wrongObject.isVisible = false
			wrongObject.isVisible = true
			event.target.text = ""
			timer.performWithDelay(2000, HideInCorrect)
			wrongSoundChannel = audio.play(wrongSound)
		end
	end
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


-- create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)

--the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

--------------------------------------------------------------------------
-- FUNCTION CALLS 
--------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

