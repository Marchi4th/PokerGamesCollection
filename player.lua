---@class Player
---@field public hand Deck 
---@field public name string
Player = {}
Player.__index = Player


---@param name string
---@param hand Deck
---@return Player
function Player.new(name, hand)
    local instance = {}
    setmetatable(instance, Player)
    instance.hand = hand
    instance.name = name
    return instance
end


---@param deck Deck 
function Player:draw(deck)
    local card = deck:deal()
    table.insert(self.hand:getCards(), card)
end


---@param card Card
function Player:play(card)
    print("play this card" .. tostring(card))
end


function Player:showHand()
    local str = ""
    local cards = self.hand:getCards()
    for i = 1, #cards do
        str = str .. tostring(cards[i]) .. " "
    end
    print(self.name .. ": " .. str)
end


function Player:sortHand()
    self.hand:sortCards()
end
