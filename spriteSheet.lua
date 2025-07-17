local SpriteSheet = {}

local function generate_quads(image, size)
    local imgX, imgY = image:getDimensions()
    local gridW = math.floor(imgX / size) - 1
    local gridH = math.floor(imgY / size) - 1

    local quads = {}
    for gridY = 0, gridH do
        for gridX = 0, gridW do
            local quad = love.graphics.newQuad(gridX * size, gridY * size, size, size, image)
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

function SpriteSheet.new(image, size)
    local self = {}

    self.image = image
    self.quads = generate_quads(self.image, size)

    self.draw = draw

    return self
end

return SpriteSheet