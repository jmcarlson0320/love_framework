local lowres = {}

local _canvas = nil
local _scale = 0

--[[
    Function: lowres.init
    Scope: Public API Function
    Description: Initializes a pixelated low resolution rendering mode with a given virtual resolution and pixel scale.
    Parameters:
        virtWidth (number) - The virtual width of the low resolution surface to render to.
        virtHeight (number) - The virtual height of the low resolution surface to render to.
        scale (number) - The scale factor for on-screen pixels. 1 virtual pixel == "scale" on-screen pixels.
    Returns:
        N/A
]]
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

--[[
    Function: lowres.beginDraw
    Scope: Public API Function
    Description: Begins low resolution drawing mode. Should be called at the beginning of the frame. Once in low
                 resolution mode, all love2d draw calls will be to a low resolution surface.
    Parameters:
        N/A
    Returns:
        N/A
]]
function lowres.beginDraw()
    love.graphics.setCanvas(_canvas)
    love.graphics.clear()
end

--[[
    Function: lowres.endDraw
    Scope: Public API Function
    Description: Ends low resolution drawing mode and presents the low resolution surface to the screen. Should be
                 called at the end of the frame. 
    Parameters:
        N/A
    Returns:
        N/A
]]
function lowres.endDraw()
    love.graphics.setCanvas()
    love.graphics.draw(_canvas, 0, 0, 0, _scale, _scale)
end

return lowres