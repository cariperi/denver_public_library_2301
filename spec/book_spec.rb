require_relative 'spec_helper'

describe Book do
  before(:each) do
    @book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@book).to be_a Book
    end
  end
end
