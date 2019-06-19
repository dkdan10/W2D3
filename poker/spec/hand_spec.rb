require 'rspec'
require 'hand'

describe Hand do

  let(:card) {double("Card")}
  let(:deck) {double("Deck", {:draw => card})}
  subject(:hand) {Hand.new(deck)}

  describe "#initialize" do
    it "should accept deck as a param" do
      expect{Hand.new(deck)}.not_to raise_error
    end
    it "should fill array with 5 cards drawn from deck" do
      expect(hand.cards.length).to eq(5)
    end
  end

  describe "#rank" do

  end


end