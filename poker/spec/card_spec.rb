require 'rspec'
require 'card'

describe Card do
  subject(:card) {Card.new(:heart, 8)}
  describe "#initialize" do
    it "should set params: suit and number" do
      expect(card.suit).to eq(:heart)
      expect(card.number).to eq(8)
    end

    it "should raise error if suit not :heart, :spade, :club, or :diamond" do
      expect {Card.new(:dog, 8)}.to raise_error(InvalidSuitError)
    end

    it "should raise error if number not between 1 and 13" do
      expect {Card.new(:heart, 50)}.to raise_error(OutOfBoundsError)
    end
  end

  describe "::create_deck" do
  
    subject(:deck) {Card.create_deck}

    it "should return an array of 52 unique cards" do
      expect(deck.length).to eq(52)
      expect(deck.uniq.length).to eq(52)
    end

    it "should return 13 cards of each suit" do
      expect([:club, :diamond, :heart, :spade].all? {|suit| deck.select {|card| card.suit == suit}.length == 13} ).to be(true)
    end

    it "should return 4 cards of each number" do
      
      expect((1..13).all? {|num| deck.select {|card| card.number == num}.length == 4}).to eq(true)

    end
  
  end

end