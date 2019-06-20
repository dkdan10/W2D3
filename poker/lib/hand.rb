require_relative 'deck'

class Hand
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    5.times do
      cards << deck.draw
    end
    cards = self.cards.sort
  end

  def rank
    # cards = self.cards.sort
    hand_type
  end

  private

  def hand_type
    is_straight = straight
    is_flush = flush
    return :straight_flush if is_straight && is_flush
    var = get_pairs
    return var if var == :four_of_a_kind || var == :full_house
    return :flush if is_flush
    return :straight if is_straight
    var
  end

  def straight
    (0...(cards.length - 1)).all? do |i|
      if cards[i].number == 1
        cards[-1].number == 13 || cards[i+1].number == 2
      else
        cards[i].number == cards[i+1].number - 1
      end
    end
  end

  def flush
    suit = cards.first.suit
    cards.all? {|card| card.suit == suit}
  end

  def get_pairs
    multiples = Hash.new {|h,k| h[k] = []}
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
    :high_card
  end

  def get_high_card
    sorted_cards = self.cards.sort
    return sorted_cards.last unless sorted_cards.first.number == 1
    sorted_cards.first
  end





end