-----------------------------------------------------------------------------------------
-- Title: Physics and collisions
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Program: this program will display balls that will roll down a beam.

-- load Physiscs 
local Physics = require("physics")

-- start physics 
physics.start()
-------------------------------------------------------------------
-- OBJECTS
-------------------------------------------------------------------

-- Ground
local ground = display.newImage("Images/ground.png",  340, 737)

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- set the wall to stop the ball
local beam_long = display.newImage("Images/beam_long.png",  500, 737)

--change the width height to be the same as the screen
beam_long.height  = display.contentHeigth

-- Add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})
--------------------------------------------------------------------------

--set the x and y positions
beam_long.x = display.contentCenterX/5
beam_long.y = display.contentCenterY* 1.65

 --rotate the beam -60 degrees so its on an angle
beam_long:rotate(45)

-- send it to the back layer
beam_long:toBack()

--add to physics
--physics.addBody(beam, "static", {friction = 0.5, bounce=0.3})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

-- set the x and y positions
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

-- send to back 
bkg:toBack()

-------------------------------------------
-- FUNCTIONS
-------------------------------------------


-- create the first ball 
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end
------------------------------------------------------------------------------------------------

local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 19.5})
end
------------------------------------------------------------------------------------------------
local function thirdBall()
	-- creating third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball3, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 26.5})
end

--------------------------------------------------------------------
-- TIMER DELAYS -call each function after this given millisecond
--------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 50, thirdBall)































