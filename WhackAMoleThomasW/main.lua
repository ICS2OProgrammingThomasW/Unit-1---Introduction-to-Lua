-----------------------------------------------------------------------------------------
-- WhackAMole
-- Name: Thomas Wehbi
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in
-- time thye score increases by 1.



-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 220/255, 195/255, 225/255)

--creating a mole
local Mouse = display.newImage( "Images/Mouse.png" , 0, 0 )
Mouse:scale(0.1, 0.1)

-- setting position
Mouse.x = display.contentCenterX
Mouse.y = display.contentCenterY

-------------------------------------------------------FUNCTIONS-------------------------------------------------------------------

-- this functionthat mkaes the mole appear in a random (x,y) position on the screen 
-- before calling the Hide function
function PopUp()

	--choosing random position on the screen between 0 and the size of the screen
	Mouse.x = math.random( 0, display.contentWidth )
	Mouse.y = math.random( 0, display.contentHeight )
end

--This function calls the PopUp function after 3 seconds 
function PopUpDelay()
	timer.performWithDelay( 4000, PopUp)
end

-- this function makes the mole invisible and then calls the PopUpDelay function 
function Hide( )


	-- changing visiblity
	Mouse.isVisible = false
end

-- this function starts the game 
function GameStart( )
	PopUpDelay()
end 

--this function increments the score only if the mole is clicked. it then displays 
-- the new score.
function Whacked( event )

	-- if touch phase just started 
	if (event.phase == "began") then 
	end 

end 

-------------------------------EVENT LISTENERS---------------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked 
-- function is called 
Mouse:addEventListener( "touch", Whacked )



-------------------------------START THE GAME------------------------------------
-- starting the game
function StartGame()
end 






