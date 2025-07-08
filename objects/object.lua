local Object = {
    x = 0,
    y = 0,
}

function Object:new(o)
    o = o or {}
    o._events = {}
    setmetatable(o, self)
    self.__index = self
    if o.init and type(o.init) == "function" then
        o:init()
    end
    return o
end

function Object:init()
    -- override by subclass
end

function Object:update(dt)
    -- override by subclass
end

function Object:draw()
    -- override by sublcass
end

function Object:on(eventName, callback)
    if not self._events[eventName] then
        self._events[eventName] = {}
    end

    table.insert(self._events[eventName], callback)
end

function Object:emit(eventName, ...)
    if self._events[eventName] then
        for _, callback in ipairs(self._events[eventName]) do
            callback(...)
        end
    end
end

return Object