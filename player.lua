---@class Player
---@field public hand table 
---@field public name string
Player = {hand = {}, name = ""}
Player.__index = Player


---@return Player
function Player.new(name)
    local instance = {}
    setmetatable(instance, Player)
    instance.hand = {}
    instance.name = name
    return instance
end


---@param deck Deck 
function Player:draw(deck)
    local card = deck:deal()
    table.insert(self.hand, card)
end


---@param card Card
function Player:play(card)
    --TODO: play a card
    print("play this card" .. tostring(card))
end


function Player:showHand()
    local str = ""
    for i = 1, #self.hand do
        str = str .. tostring(self.hand[i]) .. " "
    end
    print(self.name .. ": " .. str)
end


---@param compare function
function Player:sortHand(compare)
    table.sort(self.hand, function (a, b)
        return compare(a, b)
    end)
end
