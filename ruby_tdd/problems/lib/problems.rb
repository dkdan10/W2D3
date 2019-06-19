class Array
  def my_uniq
    duplicates = []
    self.each do |el|
      duplicates << el unless duplicates.include?(el)
    end
    duplicates
  end

  def two_sum
    pairs = []
    (0...length).each do |i1|
      ((i1+1)...length).each do |i2|
        pairs << [i1,i2] if self[i1] + self[i2] == 0
      end
    end
    pairs
  end

  def my_transpose
    new_array = Array.new(length) {Array.new(length)}
    (0...length).each do |i1|
      (0...length).each do |i2|
        new_array[i1][i2] = self[i2][i1]
      end
    end
    new_array
  end

end