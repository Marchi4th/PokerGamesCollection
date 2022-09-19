require("constant")


---@class SuitCard 
---@field public suit integer
---@field public rank integer
SuitCard = {}
SuitCard.__index = SuitCard
SuitCard.super = Card
setmetatable(SuitCard, Card)


function SuitCard:__tostring()
    return SuitType[self.suit] .. RankType[self.rank]
end


---@param suit integer
---@param rank integer
---@return Card
function SuitCard.new(suit, rank)
    local instance = SuitCard.super.new()
    setmetatable(instance, SuitCard)
    instance.suit = suit
    instance.rank = rank
    return instance
end