require_relative 'spec_helper'

describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a Author
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end

    it 'starts iwth no books by default' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe '#write' do
    before(:each) do
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @villette = @charlotte_bronte.write("Villette", "1853")
    end

    it 'creates and returns books' do
      expect(@jane_eyre.class).to be_a Book
      expect(@villette.class).to be_a Book
    end

    it 'assigns attributes to book objects' do
      expect(@jane_eyre.title).to eq('Jane Eyre')
      expect(@villette.title).to eq('Villette')
    end

    it 'adds books to an authors list of books' do
      expect(@charlotte_bronte.books).to eq([@jane_eyre, @villette])
    end
  end
end
