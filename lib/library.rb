class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    author.books.each {|book| @books << book}
    @authors << author
  end

  def publication_time_frame_for(author)
    pub_years = author.books.map{|book| book.publication_year}.sort
    time_frame_hash = {start: pub_years.first, end: pub_years.last}
  end
end
