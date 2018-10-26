-----------------------------------------------------------------------------------------
-- Title: Physics and collisions
-- Name: Thomas Wehbi
-- Course: ICS20
-- this program displays balls that roll down a beam

-- load physics 
local physics = require("physics")

-- start physics
physics.start()

-------------------------------------------------------------
-- OBJECTS
------------------------------------------------------------
-- Ground 
local ground = display.newImage("Images/ground.png", 0, 0)