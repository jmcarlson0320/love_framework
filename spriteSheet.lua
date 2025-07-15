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
local function generate_quads(image, size)
    local wPix, hPix = image:getDimensions()
    local numRows = math.floor(hPix / size)
    local numCols = math.floor(wPix / size)

    local quads = {}
    for row = 0, numRows do
        for col = 0, numCols do
            local quad = love.graphics.newQuad(col * size, row * size, size, size, image)
            table.insert(quads, quad)
        end
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
local function draw(self, id, x, y)
    if not self.quads then 
        print("quads array is nil")
        return
    end

    if id < 1 or #self.quads < id then
        print("invalid id")
        return
    end

    love.graphics.draw(self.image, self.quads[id], x, y)
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
function SpriteSheet.new(spriteImage, spriteSize)
    local self = {}

    self.image = spriteImage
    self.spriteSize = spriteSize
    self.quads = generate_quads(self.image, self.spriteSize)

    self.draw = draw

    return self
end

return SpriteSheet