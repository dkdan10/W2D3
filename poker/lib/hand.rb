require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(deck)
    @cards = []
    5.times do
      cards << deck.draw
    end
    cards = self.cards.sort
  end

  def rank
    cards = self.cards.sort
    hand_type
  end

  private

  def hand_type
    is_straight = straight
    is_flush = flush
    :straight_flush if is_straight && is_flush
    var = get_pairs
    return var if var == :four_of_a_kind || var == :full_house
    return :flush if is_flush
    return :straight if is_straight
    var
  end

  def straight
    (0...(cards.length - 1)).all? do |i|
      card[i].number == card[i+1].number - 1
    end
  end

  def flush
    suit = cards.first.suit
    cards.all? {|card| card.suit == suit}
  end

  def get_pairs
    multiples = Hash.new {Array.new}
    cards.each do |card|
      multiples[card.number] << card
    end
    multiples.select!{|k,v| v.length > 1}

    if multiples.any? {|k,v| v.length == 4}
      return :four_of_a_kind
    elsif multiples.any? {|k,v| v.length == 3}
      if multiples.any? {|k,v| v.length == 2}
        return :full_house
      else
        return :three_of_a_kind
      end
    else
      pairs = multiples.select {|k,v| v.length == 2}
      return :two_of_a_kind if pairs.length == 1
      return :two_pair if pairs.length == 2
    end
    get_high_card
  end

  def get_high_card
    self.cards.sort.last
  end





end