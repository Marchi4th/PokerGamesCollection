require("pokerDeck")


---@class Poker
Poker = {}


function Poker.createPokerDeck()
    local cards = {}
    Poker.createSuitCard(cards)
    Poker.createJokerCard(cards)

    local deck = PokerDeck.new()
    deck:setCards(cards)
    return deck
end


---@param cardsArray table
function Poker.createSuitCard(cardsArray)
    for _, suit in pairs(Suit) do
        for _, rank in pairs(Rank) do
            local suitCard = SuitCard.new(suit, rank)
            table.insert(cardsArray, suitCard)
        end
    end
end


---@param cardsArray table
function Poker.createJokerCard(cardsArray)
    for _, joker in pairs(Joker) do
        local jokerCard = JokerCard.new(joker)
        table.insert(cardsArray, jokerCard)
    end
end

