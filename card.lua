---@class Card
Card = {}
Card.__index = Card


---@return Card
function Card.new()
    local instance = {}
    setmetatable(instance, Card)
    return instance
end
