local Signal = {}

local function connect(self, object, callback)
    table.insert(self.listeners, {
        object = object,
        method = callback,
    })
end

local function emit(self, ...)
    for _, listener in pairs(self.listeners) do
        local method = listener.object[listener.method]
        if method then
            method(listener.object, ...)
        end
    end
end

function Signal.new()
    local self = {}

    self.listeners = {}
    self.connect = connect
    self.emit = emit

    return self
end

return Signal