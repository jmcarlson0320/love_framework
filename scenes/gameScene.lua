local Player = require("objects.player")

local scene = {}
local objects = {}

function scene.load()
    objects = {
        Player.new(x, y),
    }
end

function scene.update(dt)
    for _, obj in ipairs(objects) do
        obj:update(dt)
    end
end

function scene.draw()
    for _, obj in ipairs(objects) do
        obj:draw()
    end
end

return scene
