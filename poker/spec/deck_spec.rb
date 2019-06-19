require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "should set instance variable deck to an array of cards length 52" do
      expect(deck.in_deck.length).to eq(52)
      expect(deck.in_deck.all? {|card| card.is_a?(Card)}).to be(true)
    end
  end

  describe "#shuffle_cards" do
    it "should change the order of the cards" do
      ordered_cards = deck.in_deck.dup
      deck.shuffle_cards
      expect(deck.in_deck).not_to eq(ordered_cards)
      expect(deck.in_deck.sort).to eq(ordered_cards.sort)
    end
  end

  describe "#draw" do
    it "should take 1 card from in_deck and returns that card" do
      expect(deck.draw.is_a?(Card)).to be(true)
    end

    it "should update size" do
      deck.draw
      expect(deck.in_deck.length).to eq(51)
    end

    it "should raise error if deck is empty" do
      52.times {deck.draw}
      expect {deck.draw}.to raise_error(OutOfCardsError)
    end

  end

  describe "#replace" do
    it "should place card at bottom of deck" do
      card = deck.draw
      deck.replace(card)
      expect(deck.in_deck.first).to be(card)
      expect(deck.in_deck.length).to eq(52)
    end
    
    it "should raise error if param is not a card" do
      expect{deck.replace("Hey Fam")}.to raise_error(NotCardError)
    end
  end

  describe "#size" do
    it "should return the number of the cards in deck" do
      expect(deck.size).to eq(52)
      52.times {deck.draw}
      expect(deck.size).to eq(0)
    end

  end
end