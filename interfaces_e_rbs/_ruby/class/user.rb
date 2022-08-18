require "./csv"

class User < CSV

  def to_csv
    "#{@name}, #{@age}"
  end

  def from_csv(line)
    parts = line.split(",")

    @name = parts[0]
    @age = parts[1]
  end
  
end


user = User.new
user.from_csv("nome,idade")
puts user.to_csv