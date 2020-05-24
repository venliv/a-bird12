--[[
    PauseState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The PauseState class is the bulk of the game, where the player actually controls the bird and
    avoids pipes. When the player collides with a pipe, we should go to the GameOver state, where
    we then go back to the main menu.
]]

PauseState = Class{__includes = BaseState}


local PlayState savedPlay = nil

function PauseState:init()
end


function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {savedPlay = self.savedPlay})
    end
end

function PauseState:render()
	self.savedPlay:render()
	love.graphics.setFont(mediumFont)
    love.graphics.printf("Pause, press 'p' to continue", 0, 120, VIRTUAL_WIDTH, 'center')
end

--[[
    Called when this state is transitioned to from another state.
]]
function PauseState:enter(params)
	self.savedPlay = params.savedPlay;
end

--[[
    Called when this state changes to another state.
]]
function PauseState:exit()
end