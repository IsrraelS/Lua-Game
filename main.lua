-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require("physics")

physics.start( )

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local _W = display.contentWidth
local _H = display.contentHeight

display.setStatusBar( display.HiddenStatusBar )


--- fondo ---


local bkg = display.newImage("background.png", centerX, centerY)
bkg:scale(display.contentWidth/bkg.contentWidth, display.contentHeight/bkg.contentHeight)
bkg.x = display.contentWidth/2 
bkg.y = display.contentHeight/2 

--- geek ---

local geek = display.newImage( "superGuaido.png", centerX -150, centerY + 30 )
physics.addBody( geek, "dinamyc", {density = 0.5, friction = 0.5, bounce = 0.3})

--- piso ---

local piso = display.newRect(centerX, _H -1, _W, 2)
physics.addBody( piso, "static", {density = 0.1, friction = 0.5, bounce = 0.1} )

--- techo ---

local techo = display.newRect( centerX, centerY -350, _W, 2 )
physics.addBody( techo, "static", {density = 0.1, friction = 0.5, bounce = 0.1} )

--- pared1 ---

local pared1 = display.newRect( 1, _H/2, 2, _W )
physics.addBody( pared1, "static", {density = 0.1, friction = 0.5, bounce = 0.1} )

--- pared2 ---

--[[local pared2 = display.newRect( _W - 1, _H/2, 2, _H )
physics.addBody( pared2, "static", {density = 0.1, friction = 0.5, bounce = 0.1} )]]

--- numero de torres ---

for i = 1, 4 do

	--- numero de bloques ---

   for	j = 1, i do

   --- bloque ---

   local bloque = display.newImage( "clap2.png", centerX - 60 + 60 * i, centerY - j * 55 ) 
   physics.addBody(bloque, "dynamic", {density = 0.5, friction = 1, bounce = 0} )

   end

   --- hipster ---

   local hipster = display.newImage( "maduro3.png", centerX - 60 + 60 * i, centerY -25 -5 *61)
   physics.addBody( hipster, "dynamic", {density = 1, friction = 0.9, bounce = 0.2} )


end
 --- gestion de eventos ---

function geekTouched(event)

if event.phase == "began" then
	display.getCurrentStage( ):setFocus(geek)
elseif event.phase == "ended" then
    	geek:applyLinearImpulse( event.xStart - event.x , event.yStart - event.y, geek.x, geek.y)
    	display.getCurrentStage( ):setFocus( nil)
	    end
end


geek:addEventListener( "touch", geekTouched )
