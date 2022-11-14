local class = {}

Object = {}

function Object.new(className, super)
    if className == nil then
        error('define class must have className')
        return
    end

    local classType = {}
    local classTable = {}
    class[classType] = classTable

    setmetatable(classType, {__newindex = classTable, __index = classTable})

    if super then
        setmetatable(class[classType], {__index =
            function(table, key)
                local value = class[super][key]
                classTable[key] = value
                return value
            end
        })
    end

    classType.super = super
    classType.className = className
    classType.ctor = false

    if not classType.super then
        classType.constructor = function (...)
        end
    end

    classType.new = function (...)
        local instance = {}
        instance.__type = classType
        instance.__className = className
        setmetatable(instance, {__index = class[classType]})
        if classType.constructor then
            classType.constructor(instance, ...)
        end
        return instance
    end

    return classType
end

-- References
-- https://github.com/kurapica/PLoop/blob/master/README-zh.md
-- https://github.com/kurapica/PLoop
-- https://github.com/iwiniwin/LuaKit
-- https://github.com/dingshukai/lua-oop
-- https://github.com/search?q=lua+oop