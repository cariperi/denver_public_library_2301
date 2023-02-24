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
end
