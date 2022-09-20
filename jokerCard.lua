require("card")
require("constant")


---@class JokerCard : Card
---@field private joker integer
JokerCard = {}
JokerCard.__index = JokerCard
JokerCard.super = Card
setmetatable(JokerCard, Card)


---@param joker integer
---@return Card
function JokerCard.new(joker)
    local instance = JokerCard.super.new()
    setmetatable(instance, JokerCard)
    instance.joker = joker
    return instance
end


function JokerCard:__tostring()
    if self.joker == Joker.BigJoker then
        return "BJ"
    else
        return "LJ"
    end
end


---@return integer
function JokerCard:getJoker()
    return self.joker
end