require("deck")
require("player")
require("poker")

local function main(...)
    ---@type Player[]  
    local players = {}

    local arguements = {...}

    ---@type integer
    local playerCount = arguements[1]

    local deck = Deck.new()
    for i = 1, playerCount do
        players[i] = Player.new(i .. "P")
    end

    deck.cards = Poker.createDeck()
    deck:shuffleCards()

    for i = 1, #deck.cards do
        local playerIndex = i % playerCount ~= 0 and i % playerCount or playerCount
        players[playerIndex]:draw(deck)
    end

    for i = 1, playerCount do
        players[i]:sortHand(Poker.compareCard)
        players[i]:showHand()
    end
end

main(3)