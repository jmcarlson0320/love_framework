local SpriteSheet = {}

local function generate_quads(image, spriteWidth, spriteHeight)
    local imgX, imgY = image:getDimensions()
    local gridW = math.floor(imgX / spriteWidth) - 1
    local gridH = math.floor(imgY / spriteHeight) - 1

    local quads = {}
    for gridY = 0, gridH do
        for gridX = 0, gridW do
            local quad = love.graphics.newQuad(gridX * spriteWidth, gridY * spriteHeight, spriteWidth, spriteHeight, image)
            table.insert(quads, quad)
        end
    end

    return quads
end

local function draw(self, id, x, y)
    if not self.quads then 
        print("quads array is nil")
        return
    end

    if id < 1 or #self.quads < id then
        print("sprite id out of range")
    end

    local quad = self.quads[id]

    if quad then
        love.graphics.draw(self.image, quad, x, y)
    end
end

function SpriteSheet.new(image, spriteWidth, spriteHeight)
    local self = {}

    self.image = image
    self.quads = generate_quads(self.image, spriteWidth, spriteHeight)

    self.draw = draw

    return self
end

return SpriteSheet
