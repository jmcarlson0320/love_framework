local SpriteSheet = {}

--[[
    Function: generate_quads
    Scope: Private Helper Function
    Description: Generates a list of love2d Quads by dividing an image into squares of a given size.
    Parameters:
        image (love2d Image) - The image to be divided.
        size (number) - The size of a single quad in pixels.
    Returns:
        quads (table) - The list of love2d Quads
]]
local function generate_quads(image, spriteInfo)
    local size = spriteInfo.gridSize
    local quads = {}

    for i, sprite in ipairs(spriteInfo.sprites) do
        local quad = love.graphics.newQuad(sprite.x * size, sprite.y * size, size, size, image)
        quads[sprite.name] = quad
    end

    return quads
end

--[[
    Function: spriteSheetInstance:draw
    Scope: Member Function
    Description: Draws a sprite with a given index at pixel coordinates x and y.
    Parameters:
        id (number) - The index of the sprite to draw. Sprites are indexed left-to-right and top-to-bottom, with 1 being
                      the top-left sprite in the sprite sheet.
        x (number) - The target x coordinate in pixels.
        y (number) - The target y coordinate in pixels.
    Returns:
        N/A
]]
local function draw(self, name, x, y)
    if not self.quads then 
        print("quads array is nil")
        return
    end

    local quad = self.quads[name]

    if quad then
        love.graphics.draw(self.image, quad, x, y)
    end
end

--[[
    Function: SpriteSheet.new
    Scope: Class Function
    Description: Constructs a new sprite sheet given an image and the sprite dimensions in pixels.
    Parameters:
        spriteImage (love2d Image) - The image containing the sprites.
        spriteSize (number) - The size of a single sprite in pixels. Typically 16 pixels.
    Returns:
        spriteSheet (table) - A new instance of SpriteSheet
]]
function SpriteSheet.new(image, spriteInfo)
    local self = {}

    self.image = image
    self.spriteInfo = spriteInfo
    self.quads = generate_quads(self.image, self.spriteInfo)

    self.draw = draw

    return self
end

return SpriteSheet
