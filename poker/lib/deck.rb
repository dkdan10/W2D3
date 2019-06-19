require_relative 'card'

class Deck

  attr_reader :in_deck

  def initialize
    @in_deck = Card.create_deck
    # @out_deck = []
    shuffle_cards
  end

  def shuffle_cards
    in_deck.shuffle!
  end

  def draw
    raise OutOfCardsError if size == 0
    in_deck.pop
  end

  def replace(card)
    raise NotCardError unless card.is_a?(Card)
    in_deck.unshift(card)
  end

  def size
    in_deck.length
  end

end

class OutOfCardsError < StandardError
end

class NotCardError < StandardError
end