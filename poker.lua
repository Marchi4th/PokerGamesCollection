require("suitCard")
require("jokerCard")


---@class Poker
Poker = {}


function Poker.createDeck()
    -- reset deck to empty
    local deck = {}
    Poker.createSuitCard(deck)
    Poker.createJokerCard(deck)
    return deck
end


---@param deck Deck
function Poker.createSuitCard(deck)
    for _, suit in pairs(Suit) do
        for _, rank in pairs(Rank) do
            local suitCard = SuitCard.new(suit, rank)
            table.insert(deck, suitCard)
        end
    end
end


---@param deck Deck
function Poker.createJokerCard(deck)
    for _, joker in pairs(Joker) do
        local jokerCard = JokerCard.new(joker)
        table.insert(deck, jokerCard)
    end
end


---@param a SuitCard|JokerCard @extends Card
---@param b SuitCard|JokerCard @extends Card
---@return boolean
function Poker.compareCard(a, b)
    if a.joker and b.joker then
        return a.joker < b.joker
    end

    local aSuit = a.suit or 0
    local bSuit = b.suit or 0

    local aRank = a.rank or 0
    local bRank = b.rank or 0

    if aSuit ~= bSuit then
        return aSuit < bSuit
    end
    return aRank < bRank
end