local lowres = {}

local _canvas = nil
local _scale = 0

function lowres.init(virtWidth, virtHeight, scale)
    local screenWidth = virtWidth * scale
    local screenHeight = virtHeight * scale
    local windowSettings = {
        fullscreen = false,
        centered = true,
    }

    love.window.setMode(screenWidth, screenHeight, windowSettings)

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")

    _canvas = love.graphics.newCanvas(virtWidth, virtHeight)
    _scale = scale
end

function lowres.beginDraw()
    love.graphics.setCanvas(_canvas)
    love.graphics.clear()
end

function lowres.endDraw()
    love.graphics.setCanvas()
    love.graphics.draw(_canvas, 0, 0, 0, _scale, _scale)
end

return lowres