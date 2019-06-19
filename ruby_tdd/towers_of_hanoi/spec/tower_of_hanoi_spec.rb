require 'rspec'
require 'tower_of_hanoi'

describe TowersOfHanoi do
  
  subject(:toh) {TowersOfHanoi.new}

  describe "#initialize" do
    it "should have an array of three arrays representing pegs" do
      expect(toh.pegs.length).to eq(3)
      expect(toh.pegs.first.length).to eq(3)
      expect(toh.pegs[1].length).to eq(0)
      expect(toh.pegs[2].length).to eq(0)
    end
  end 

  describe "#prompt" do
      # it "returns " do
      # end
  end

  describe "#move" do
    it "takes two parameters, from and to" do
      expect{toh.move(0, 1)}.not_to raise_error
    end

    it "moves disc from first param to second param" do
      toh.move(0,1)
      expect(toh.pegs).to eq([[2, 3], [1], []])
    end

    it "should raise error if from peg empty" do
      expect {toh.move(1,0)}.to raise_error(EmptyPegError)
    end

    it "should not let player place bigger disc on smaller disc" do
      toh.move(0,1)
      expect {toh.move(0,1)}.to raise_error(DiskTooBigError)
    end
  end

  describe "#won?" do
    it "should return true when all discs are on last peg" do
      toh.pegs = [[], [], [1, 2, 3]]
      expect(toh.won?).to be(true)
    end

    it "should return false when discs are not all on last peg" do
      toh.move(0,2)
      toh.move(0,1)
      expect(toh.won?).to be(false)
    end
  end

end