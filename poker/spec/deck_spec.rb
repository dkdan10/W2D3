require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "should set instance variable deck to an array of cards length 52" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.all? {|card| card.is_a?(Card)}).to be(true)
    end
    
    let(:Card) {double("Card", {:create_deck => [Array.new(52)]})}
    it "should call Card::create_deck" do
      expect(Card).to receive(:create_deck)
      Deck.new
    end
  end
  describe "#shuffle_cards" do
    it "should change the order of the cards" do
      ordered_cards = deck.cards.dup
      deck.shuffle_cards
      expect(deck.cards).not_to eq(ordered_cards)
      expect(deck.cards.sort).to eq(ordered_cards.sort)
    end
  end
end