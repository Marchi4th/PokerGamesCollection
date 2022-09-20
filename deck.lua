require("card")


---@class Deck 
---@field private cards table
Deck = {} 
Deck.__index = Deck


---@return Deck
function Deck.new()
    local instance = {}
    setmetatable(instance, Deck)
    instance.cards = {}
    return instance
end


function Deck:shuffleCards()
    for i = 1, #self.cards do
        local index = math.random(1, #self.cards)
        self.cards[i], self.cards[index] = self.cards[index], self.cards[i]
    end
end


---@return nil|Card
function Deck:deal()
    local cardsCount = #self.cards
    if cardsCount <= 0 then
        return nil
    end

    return table.remove(self.cards, cardsCount)
end


---@return table
function Deck:getCards()
    return self.cards
end


---@param cards table
function Deck:setCards(cards)
    self.cards = cards
end


function Deck:sortCards()
    error("Should be implemented in subclass")
end