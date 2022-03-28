
class ArrayStack
  def self.empty
    new
  end

  def initialize(array = nil)
    @stack = array || Array.new
  end


  def empty?
    @stack.empty?
  end

  def push(value)
    ArrayStack.new([*@stack, value])
  end

  def top
    @stack.last
  end

  def pop
    ArrayStack.new(@stack[0..-2])
  end

  def ==(other)
    other.to_a == to_a
  end

  def to_a
    @stack
  end
end

RSpec.describe ArrayStack do
  describe '.empty' do
    it 'returns an empty stack' do
    end
  end

  describe '#empty?' do
    context 'when the stack is empty' do
      let(:empty_stack) { ArrayStack.empty }

      it 'is true' do
        # Exercise
        actual = empty_stack.empty?

        # Assertion
        expect(actual).to be true
      end
    end

    context 'when the stack is not empty' do
      let(:value) { 1 } 
      let(:empty_stack) { ArrayStack.empty }
      let(:stack) { empty_stack.push(value) } 

      it 'is false' do
        expect(stack.empty?).to be false
      end
    end
  end

  describe '#top' do 
    context 'when there is at least one item' do
      it 'returns the top value' do
        value = 1
        stack = ArrayStack.new
        stack = stack.push(value)
        
        expect(stack.top).to be value
      end
    end

    context 'when there is no item in the stack' do
      it 'is nil' do
        stack = ArrayStack.new
        
        expect(stack.top).to be_nil
      end
    end
  end

  describe '#==' do
    context 'when the stacks have the same items' do
      it 'is true' do
        value = 1
        stack = ArrayStack.new
        new_stack = stack.push(value).pop

        expect(new_stack).to eq stack
      end
    end
  end
end

