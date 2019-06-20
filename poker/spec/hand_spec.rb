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
    it "should return :straight_flush when hand has straight flush" do
      hand.cards = [
        double("card", {:suit => :heart, :number =>9}),
        double("card", {:suit => :heart, :number =>10}),
        double("card", {:suit => :heart, :number =>11}),
        double("card", {:suit => :heart, :number =>12}),
        double("card", {:suit => :heart, :number =>13})
      ]
      expect(hand.rank).to eq(:straight_flush)
    end
    it "should return :four_of_a_kind when hand has four of a kind" do
      hand.cards = [
        double("card", {:suit => :heart, :number =>9}),
        double("card", {:suit => :spade, :number =>9}),
        double("card", {:suit => :diamond, :number =>9}),
        double("card", {:suit => :club, :number =>9}),
        double("card", {:suit => :heart, :number =>13})
      ]
      expect(hand.rank).to eq(:four_of_a_kind)
    end
    it "should return :flush when hand has flush" do
      hand.cards = [
        double("card", {:suit => :heart, :number =>9}),
        double("card", {:suit => :heart, :number =>10}),
        double("card", {:suit => :heart, :number =>6}),
        double("card", {:suit => :heart, :number =>3}),
        double("card", {:suit => :heart, :number =>13})
      ]
      expect(hand.rank).to eq(:flush)
    end
    it "should return :straight when hand has straight" do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>5}),
        double("card", {:suit => :heart, :number =>6}),
        double("card", {:suit => :heart, :number =>7}),
        double("card", {:suit => :diamond, :number =>8}),
        double("card", {:suit => :heart, :number =>9})
      ]
      expect(hand.rank).to eq(:straight)
    end
    it "should return :full_house when hand has full house" do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>5}),
        double("card", {:suit => :club, :number =>5}),
        double("card", {:suit => :heart, :number =>5}),
        double("card", {:suit => :diamond, :number =>9}),
        double("card", {:suit => :heart, :number =>9})
      ]
      expect(hand.rank).to eq(:full_house)
    end
    it "should return :three_of_a_kind flush when hand has three of a kind" do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>6}),
        double("card", {:suit => :club, :number =>6}),
        double("card", {:suit => :heart, :number =>6}),
        double("card", {:suit => :diamond, :number =>8}),
        double("card", {:suit => :heart, :number =>9})
      ]
      expect(hand.rank).to eq(:three_of_a_kind)
    end
    it "should return :two_pair flush when hand has two pair" do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>5}),
        double("card", {:suit => :heart, :number =>5}),
        double("card", {:suit => :heart, :number =>7}),
        double("card", {:suit => :diamond, :number =>8}),
        double("card", {:suit => :club, :number =>7})
      ]
      expect(hand.rank).to eq(:two_pair)
    end
    it "should return :two_of_a_kind flush when hand has two of a kind" do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>5}),
        double("card", {:suit => :heart, :number =>7}),
        double("card", {:suit => :club, :number =>7}),
        double("card", {:suit => :diamond, :number =>8}),
        double("card", {:suit => :heart, :number =>9})
      ]
      expect(hand.rank).to eq(:two_of_a_kind)
    end
    it "should return :high_card when hand has only a high card"do 
      hand.cards = [
        double("card", {:suit => :spade, :number =>1}),
        double("card", {:suit => :heart, :number =>5}),
        double("card", {:suit => :heart, :number =>6}),
        double("card", {:suit => :diamond, :number =>8}),
        double("card", {:suit => :heart, :number =>4})
      ]
      expect(hand.rank).to eq(:high_card)
    end

    it "should accept and ace (1) as higher than 13 and lower than 2 but not both" do
      hand.cards = [
        double("card", {:suit => :heart, :number =>1}),
        double("card", {:suit => :heart, :number =>10}),
        double("card", {:suit => :heart, :number =>11}),
        double("card", {:suit => :heart, :number =>12}),
        double("card", {:suit => :heart, :number =>13})
      ]
      expect(hand.rank).to eq(:straight_flush)

      hand.cards = [
        double("card", {:suit => :heart, :number =>1}),
        double("card", {:suit => :club, :number =>2}),
        double("card", {:suit => :heart, :number =>11}),
        double("card", {:suit => :diamond, :number =>12}),
        double("card", {:suit => :spade, :number =>13})
      ]
      expect(hand.rank).to eq(:high_card)

    end
  end


end