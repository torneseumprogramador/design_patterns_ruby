class Super
  def initialize(val:)
    @val = val
  end

  def print_val
    puts("O valor de val é #{self.val}")
  end

  private
    attr_reader :val
end

# sup = Super.new(1) # errado
sup = Super.new(val: 1)
puts sup.print_val