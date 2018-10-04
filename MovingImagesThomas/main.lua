-----------------------------------------------------------------------------------------
-- Title: MovingImages
-- Name: Thomas Wehbi
-- Course: ICS2O/3C
-- This program displays an image that move across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- output: none 
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- Move Ship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

---------------------------------------------------------------------

scrollSpeedRocket = 4

-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set the image to be transparent
rocketship.alpha = 1

-- set the initial x and y position of rocketship
rocketship.x = 1048
rocketship.y = display.contentHeight/1.5

-- Function: Ship
-- Input: this function accepts an event listener
-- output: none 
-- Description: This function adds the scroll speed rocket to the x-value of the ship
local function MoveRocket(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x - scrollSpeedRocket
	-- change the transparency of the ship every time it moves so that it fades out
	rocketship.alpha = rocketship.alpha + 0.01
end

-- Move rocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocket)

rocketship:scale( -1, -1 )