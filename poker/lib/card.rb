class Card

  attr_reader :suit, :number

  SUITS = [:heart, :space, :club, :diamond].freeze
  def initialize(suit, number)
    raise InvalidSuitError unless SUITS.include?(suit)
    raise OutOfBoundsError unless number.between?(1,13)
    @suit = suit
    @number = number
  end

  def self.create_deck
    deck = []
    SUITS.each do |suit|
      (1..13).each do |num|
        deck << Card.new(suit, num)
      end
    end
    deck
  end
end

class InvalidSuitError < StandardError
end

class OutOfBoundsError < StandardError
end