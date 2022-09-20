require("card")
require("constant")


---@class SuitCard : Card
---@field private suit integer
---@field private rank integer
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


---@return integer
function SuitCard:getSuit()
    return self.suit
end


---@return integer
function SuitCard:getRank()
    return self.rank
end