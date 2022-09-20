require("deck")
require("suitCard")
require("jokerCard")


---@class PokerDeck : Deck
---@field private cards table
PokerDeck = {}
PokerDeck.__index = PokerDeck
PokerDeck.super = Deck
setmetatable(PokerDeck, Deck)


---@return Deck
function PokerDeck.new()
    local instance = PokerDeck.super.new()
    setmetatable(instance, PokerDeck)
    return instance
end


function PokerDeck:sortCards()
    local cards = self:getCards()
    table.sort(cards, function (a, b)
        if getmetatable(a) == JokerCard and getmetatable(b) == JokerCard then
            return a:getJoker() < b:getJoker()
        elseif getmetatable(a) == JokerCard and getmetatable(b) == SuitCard then
            return true
        elseif getmetatable(a) == SuitCard and getmetatable(b) == JokerCard then
            return false
        elseif getmetatable(a) == SuitCard and getmetatable(b) == SuitCard then
            local aSuit = a:getSuit()
            local bSuit = b:getSuit()
    
            local aRank = a:getRank()
            local bRank = b:getRank()
    
            if aSuit ~= bSuit then
                return aSuit < bSuit
            end
            return aRank < bRank
        end
    end)
end