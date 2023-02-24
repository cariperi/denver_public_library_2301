class Library
  attr_reader :name,
              :books,
              :authors,
              :current_loans

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @current_loans = []
  end

  def add_author(author)
    author.books.each {|book| @books << book}
    @authors << author
  end

  def publication_time_frame_for(author)
    pub_years = author.books.map{|book| book.publication_year}.sort
    time_frame_hash = {start: pub_years.first, end: pub_years.last}
  end

  def check_out(book)
    return 'Sorry, we do not have this book.' if !@books.include?(book)
    @current_loans << book
  end

  def return(book)
    @current_loans.delete(book)
  end
end
