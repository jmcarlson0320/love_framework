local SpriteSheet = {}

local assets = require("assets")

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
    print("generating quads")
    print("numRows: " .. numRows .. " numCols: " .. numCols)

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

    if not self.spriteInfo then
        print("spriteInfo array is nil")
        return
    end

    if id < 1 or #self.spriteInfo.sprites < id then
        --print("invalid id: " .. id)
        return
    end

    print("begin draw id: " .. id)
    local sprite = self.spriteInfo.sprites[id]
    for row = sprite.y, sprite.y + sprite.h - 1 do
        for col = sprite.x, sprite.x + sprite.w - 1 do
            print("row: " .. row .. " col: " .. col)
            local index = row * self.spriteInfo.gridWidth + col + 1
            print("index: " .. index)

            love.graphics.draw(self.image, self.quads[index], x, y)
        end
    end
end

local function find(self, name)
    for i, v in ipairs(self.spriteInfo.sprites) do
        if v.name == name then
            return i
        end
    end

    return -1
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
function SpriteSheet.new(spriteImage, spriteInfo)
    local self = {}

    self.image = assets.get(spriteInfo.imageName)
    self.spriteSize = spriteInfo.gridSize
    self.quads = generate_quads(self.image, self.spriteSize)
    self.spriteInfo = spriteInfo

    self.draw = draw
    self.find = find

    return self
end

return SpriteSheet
