require_relative 'spec_helper'

describe Library do
  before(:each) do
    @library = Library.new('Turing Library')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a Library
    end

    it 'has a name' do
      expect(@library.name).to eq('Turing Library')
    end
  end
end
