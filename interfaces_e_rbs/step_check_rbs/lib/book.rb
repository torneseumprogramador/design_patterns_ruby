class Book
  def initialize(pages)
    @pages = pages
  end

  def pages
    @pages
  end
end

first_book = Book.new(100) # correto
# first_book = Book.new("100") # errado
puts first_book.pages