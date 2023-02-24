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
    return 'This book is already checked out!' if @current_loans.include?(book)
    book.checkout_count += 1
    @current_loans << book
  end

  def return(book)
    return 'Nobody has checked out this book!' if !@current_loans.include?(book)
    @current_loans.delete(book)
  end

  def most_popular_book
    max_count = @books.map {|book| book.checkout_count}.max
    @books.find {|book| book.checkout_count == max_count}
  end
end
