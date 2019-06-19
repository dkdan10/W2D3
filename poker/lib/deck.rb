require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
    @cards = Card.create_deck
    # shuffle_cards
  end

  def shuffle_cards
    cards.shuffle!
  end

end