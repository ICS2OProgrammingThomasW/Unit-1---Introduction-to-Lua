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
local mole = display.newImage( "Images/mole.png" , 0, 0 )

-- setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY

-------------------------------------------------------FUNCTIONS-------------------------------------------------------------------

-- this functionthat mkaes the mole appear in a random (x,y) position on the screen 
-- before calling the Hide function
function PopUp()

	--choosing random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )
end

--This function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp)
end





