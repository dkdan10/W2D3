require 'rspec'
require 'problems'

describe Array do

  describe "#my_uniq" do
    subject(:arr) { [1, 2, 1, 3, 3] }  

    it "doesn't call Array#uniq" do
      expect(arr).not_to receive(:uniq)
      arr.my_uniq
    end

    it "returns an array with no duplicates" do
      expect(arr.my_uniq).to eq(arr.uniq)
    end

    it "does not modify the original array" do
      arr.my_uniq
      expect(arr).to eq([1, 2, 1, 3, 3])
    end
  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] } 

    it "finds all pairs of indices that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should return all pairs with smaller index first" do
      arr.two_sum.each do
        expect(arr.first < arr.last).to be(true)
      end
    end

    it "should be ordered by smaller first element first" do
      sums = arr.two_sum
      result = (1...sums.length).all? {|i| sums[i-1][0] < sums[i][0]}
      expect(result).to be(true)
    end

    it "should be ordered by smaller second element first if first element is same" do
      sums = arr.two_sum
      result = (1...sums.length).all? {|i| sums[i-1][0] == sums[i][0] ? sums[i-1][1] < sums[i][1] : true }
      expect(result).to be(true)
    end

  end

  describe "#my_transpose" do
    subject(:rows) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }

    it "returns a transposed array" do
      cols = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      expect(rows.my_transpose).to eq(cols)
    end

    it "does not modify the original array" do
      rows.my_transpose
      expect(rows).to eq([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ])
    end

    it "does not call Array#transpose" do
      expect(rows).not_to receive(:transpose)
      rows.my_transpose
    end
  end

end