

class Counter
  def initialize(value = nil)
    @value = value || 0
  end
  
  attr_reader :value

  def tick
    @value += 1
  end
end

RSpec.describe Counter do
  describe '#value' do
    let(:counter) { Counter.new } 

    before do
      counter.tick
    end

    specify do 
      expect(counter.value).to eq 1
    end

    specify do
      expect(counter.value).to be_an Integer
    end

    context do
      let(:counter) { Counter.new(1) }

      specify do 
        expect(counter.value).to eq 2
      end
    end
  end
end
