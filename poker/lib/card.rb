class Card

  attr_reader :suit, :number

  SUITS = [:club, :diamond, :heart, :spade].freeze
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

  def <=>(other_card)
    case number <=> other_card.number
    when -1
      return -1
    when 1
      return 1
    when 0
      case SUITS.index(suit) <=> SUITS.index(other_card.suit)
      when -1
        return -1
      when 1
        return 1
      when 0
        return 0
      end
    end
  end
  
end

class InvalidSuitError < StandardError
end

class OutOfBoundsError < StandardError
end