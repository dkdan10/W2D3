class TowersOfHanoi

  attr_accessor :pegs

  def initialize
    @pegs = [[1, 2, 3], [], []]
  end

  def prompt
    puts "Enter peg from which you want to move disk:"
    from = gets.chomp.to_i
    puts "Enter peg to which you want to move disk:"
    to = gets.chomp.to_i
    move(from, to)
  end

  def move(from, to)
    raise EmptyPegError if pegs[from].empty?
    unless pegs[to].empty?
      raise DiskTooBigError if pegs[from].first > pegs[to].first
    end
    self.pegs[to].unshift(self.pegs[from].shift)
  end

  def won?
    pegs[0].empty? && pegs[1].empty? && pegs[2].length == 3
  end

end

class EmptyPegError < StandardError
end

class DiskTooBigError < StandardError
end