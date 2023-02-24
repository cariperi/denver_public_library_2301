require_relative 'spec_helper'

describe Library do
  before(:each) do
    @library = Library.new('Turing Library')
    @shakespeare = Author.new({first_name: "William",
                                last_name: "Shakespeare"})
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @hamlet = @shakespeare.write("Hamlet", "1603")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a Library
    end

    it 'has a name' do
      expect(@library.name).to eq('Turing Library')
    end

    it 'has a list of books which is empty by default' do
      expect(@library.books).to eq([])
    end

    it 'has a list of authors which is empty by default' do
      expect(@library.authors).to eq([])
    end

    it 'has a list of books currently checked out which is empty by default' do
      expect(@library.current_loans).to eq([])
    end
  end

  describe '#add_author' do
      it 'can add authors to the list of authors' do
        expect(@library.add_author(@charlotte_bronte)).to eq([@charlotte_bronte])
      end

      it 'can add books to the list of books' do
        @library.add_author(@charlotte_bronte)

        expect(@library.books).to eq([@jane_eyre, @villette])
      end
  end

  describe '#publication_time_frame_for' do
    before(:each) do
      @library.add_author(@charlotte_bronte)
      @time_frame = @library.publication_time_frame_for(@charlotte_bronte)
    end

    it 'returns a hash with a start year and end year keys' do
      expect(@time_frame).to be_a Hash
      expect(@time_frame.count).to eq(2)
      expect(@time_frame.keys).to eq([:start, :end])
    end

    it 'returns the pub year of the authors first and last books as values' do
      expect(@time_frame.values.count).to eq(2)
      expect(@time_frame[:start]).to eq('1847')
      expect(@time_frame[:end]).to eq('1853')
    end
  end

  describe '#check_out' do
    before(:each) do
      @library.add_author(@charlotte_bronte)
    end

    it 'checks a book out from the library' do
      @library.check_out(@jane_eyre)

      expect(@library.current_loans).to eq([@jane_eyre])
    end

    it 'returns an error and does nothing if the book is not in the collection' do
      expect(@library.check_out(@hamlet)).to eq('Sorry, we do not have this book.')

      @library.check_out(@hamlet)

      expect(@library.current_loans).to eq([])
    end
  end

  describe '#return' do
    before(:each) do
      @library.add_author(@charlotte_bronte)
      @library.check_out(@jane_eyre)
      @library.check_out(@villette)
    end

    it 'returns the book to the library' do
      expect(@library.current_loans).to eq([@jane_eyre, @villette])

      @library.return(@jane_eyre)

      expect(@library.current_loans).to include(@villette)
      expect(@library.current_loans).to_not include(@jane_eyre)
    end

    it 'returns an error and does nothing if the book is not checked out' do
      expect(@library.return(@hamlet)).to eq('Nobody has checked out this book!')
      expect(@library.current_loans).to eq([@jane_eyre, @villette])
    end
  end

  describe '#most_popular_book' do
    before(:each) do
      @library.add_author(@charlotte_bronte)
      @library.add_author(@shakespeare)
    end

    it 'returns the book that has been checked out the most times' do
      2.times{@library.check_out(@hamlet)}
      3.times{@library.check_out(@jane_eyre)}
      4.times{@library.check_out(@villette)}

      expect(@library.most_popular_book).to eq(@villette)
    end
  end
end
