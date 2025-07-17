local Signal = {}

local function connect(self, callback)
    if not callback then
        return
    end

    table.insert(self.callbacks, callback)
end

local function emit(self, ...)
    for _, callback in pairs(self.callbacks) do
        callback(...)
    end
end

function Signal.new()
    local self = {}

    self.callbacks = {}

    self.connect = connect
    self.emit = emit

    return self
end

return Signal