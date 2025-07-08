local Object = require("objects.object")

local Player = Object:new({
    dx = 0,
    dy = 0,
    sprite = 1,
})

function Player:init()
end

function Player:update(dt)
end

function Player:draw()
    love.graphics.print("this is the player's draw function")
end

return Player