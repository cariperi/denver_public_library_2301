require_relative 'spec_helper'

describe Library do
  before(:each) do
    @library = Library.new('Turing Library')
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
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
end
