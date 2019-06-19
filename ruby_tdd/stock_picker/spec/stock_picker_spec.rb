require 'rspec'
require 'stock_picker'

describe "#stock_picker" do

  subject(:stocks) {[30,40,500,80,1000,10]}

  it "should return the indicies of the greatest diffrence in price" do
    expect(stock_picker(stocks)).to eq([0,4])
  end

  it "the first index of the pair smaller or equal to the second index" do
    result = stock_picker(stocks) 
    expect(result[0] <= result[1]).to be(true)
  end

  it "should raise error if stocks arr has no values" do
    expect{stock_picker([])}.to raise_error(ArgumentError)
  end

end