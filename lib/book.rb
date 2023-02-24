class Book
  attr_accessor :checkout_count

  attr_reader :title,
              :author,
              :publication_year

  def initialize(details)
    @title = details[:title]
    @author = details[:author_first_name] + ' ' + details[:author_last_name]
    @publication_year = details[:publication_date][-4..-1]
    @checkout_count = 0
  end
end
