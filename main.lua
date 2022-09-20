require("poker")
require("player")


local function main(...)
    ---@type Player[]  
    local players = {}

    local arguements = {...}

    ---@type integer
    local playerCount = arguements[1]

    for i = 1, playerCount do
        local playerHand = PokerDeck.new()
        players[i] = Player.new(i .. "P", playerHand)
    end

    local deck = Poker.createPokerDeck()
    deck:shuffleCards()
    local deckCards = deck:getCards()

    for i = 1, #deckCards do
        local playerIndex = i % playerCount ~= 0 and i % playerCount or playerCount
        players[playerIndex]:draw(deck)
    end

    for i = 1, playerCount do
        players[i]:sortHand()
        players[i]:showHand()
    end
end

main(3)