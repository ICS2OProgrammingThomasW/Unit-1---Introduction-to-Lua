-- Title: Area of Rect and Circle 
-- Name: Thomas Wehbi
-- Course: ICS20/3C
-- This program displays a rectangle and shows its area
-----------------------------------------------------------------------------------------

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle 

local areaTextCircle
local textSizeCircle = 50
local radiusOfCircle = 200
local areaOfCircle
local PI = 3.14

-- set the background color of ym screen.Remember that colors are between 0 and 1.
display.setDefault("background", 28/255, 121/255, 143/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- draw the circle that is half the width and height of the screen size.
myCircle = display.newCircle(852, 140, 130)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the width of the border
myCircle.strokeWidth = 20

-- set the color of the circle
myRectangle:setFillColor(0.8, 0.6, 0.9)

-- set the color of the circle 
myCircle:setFillColor(0.6, 0.1, 0.9)

-- set the color of the border
myRectangle:setStrokeColor(0, 56, 81)

-- set the color of the border
myCircle:setStrokeColor(0, 36, 51)

-- calculate the area 
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- calculate the area 
areaOfCircle = radiusOfCircle * PI

-- write the area on the screen. Take into consideration the size of font when positioning it on the screen 
areaText = display.newText("The area of this rectangle with a width of \n" ..
    widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
    areaOfRectangle .. " pixels².", 100, 100, Arial, textSize)
-- anchor the text and set its (x,y) position

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 50
areaText.y = display.contentHeight/2

-- write the area on the screen. Take into consideration the size of font when positioning it on the screen 
areaTextCircle= display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " and ".. " is " ..
	areaOfCircle .. " pixels².", 150, 150, Arial, textSizeCircle) 


-- anchor the text and set its (x,y) position
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 50
areaTextCircle.y = 550

-- set the color of the newText
areaText:setTextColor(1, 1, 1)