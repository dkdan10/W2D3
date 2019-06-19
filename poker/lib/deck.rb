require_relative 'card'

class Deck

  def initialize
    @deck = Card.create_deck
  end

end