class Author
  attr_reader :name,
              :books

  def initialize(name)
    @name = name[:first_name] + ' ' + name[:last_name]
    @books = []
  end

  def write(title, date)
    details = {}
    details[:author_first_name] = @name.split(" ").first
    details[:author_last_name] = @name.split(" ").last
    details[:title] = title
    details[:publication_date] = date

    new_book = Book.new(details)
    @books << new_book
    new_book
  end
end
