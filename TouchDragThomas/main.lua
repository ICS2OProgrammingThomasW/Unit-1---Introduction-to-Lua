-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Thomas Wehbi 
-- Course: ICS20
-- This program displays images the react to a person's finger.

-- hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- local variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.starHeight

local heart = display.newImageRect("Images/heart.png", 150, 150)
local heartWidth = heart.Width
local heartHeight = heart.Height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedStar = false
local alreadyTouchedheart = false

-- set the initial x and y postion of myImage
star.x = 400
star.y = 500

heart.x = 300
heart.y = 200

-- Function: HeartListener
-- Input: touch listener
-- output: none
-- Description: when heart is touched, move it 
local function heartListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedStar == false) then
			alreadyTouchedheart = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedheart == true) ) then

          heart.x = touch.x
          heart.y = touch.y
    end

    if   (touch.phase == "ended") then
          alreadyTouchedheart = false
          alreadyTouchedStar = false
    end 
end


heart:addEventListener("touch", HeartListener)


local function starListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedheart == false) then
			alreadyTouchedstar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then

          star.x = touch.x
          star.y = touch.y
    end

    if   (touch.phase == "ended") then
          alreadyTouchedstar = false
          alreadyTouchedeart = false
    end 
end

-- add the respective listeners to each object
star:addEventListener("touch", StarListener)
heart:addEventListener("touch", HeartListener)


