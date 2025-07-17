local Animation = {}

local function update(self, dt)
    self.timer = self.timer + dt
    if self.timer >= self.frameTime then
        self.timer = self.timer - self.frameTime

        self.frameIndex = self.frameIndex + 1
        if self.frameIndex > #self.frameList then
            self.frameIndex = 1
        end
    end
end

local function draw(self, x, y)
    local id = self.frameList[self.frameIndex]
    self.spriteSheet:draw(id, x, y)
end

function Animation.new(spriteSheet, frameList, fps)
    local self = {}

    self.spriteSheet = spriteSheet
    self.frameList = frameList
    self.fps = fps
    self.frameTime = 1 / fps
    self.frameIndex = 1
    self.timer = 0

    self.update = update
    self.draw = draw

    return self
end

return Animation