describe Stack do
  before :each do
    @stack = Stack.new
  end

  context 'empty list' do
    it 'should have length 0 when initialized' do
      expect(@stack.length).to eq(0)
    end

    it 'should return nil when peeking' do
      expect(@stack.peek).to be(nil)
    end

    it 'should return nil when popping' do
      expect(@stack.pop).to be(nil)
    end
  end

  context 'inserting one item' do
    before :each do
      @stack.push('Randall')
    end

    it 'should update length' do
      expect(@stack.length).to eq(1)
    end

    context 'peek' do
      it 'should return object' do
        expect(@stack.peek).to eq('Randall')
      end

      it 'should not change list length' do
        @stack.peek
        expect(@stack.length).to eq(1)
      end
    end

    context 'pop' do
      it 'should return object' do
        expect(@stack.pop).to eq('Randall')
      end

      it 'should decrement list length' do
        @stack.pop
        expect(@stack.length).to eq(0)
      end
    end
  end

  context 'inserting multiple items' do
    before :each do
      @stack.push('Jeffrey')
      @stack.push('Andrew')
    end

    it 'should update length' do
      expect(@stack.length).to eq(2)
    end

    context 'peek' do
      it 'should return the last item inserted' do
        expect(@stack.peek).to eq('Andrew')
      end
    end

    context 'pop' do
      it 'should update length' do
        @stack.pop
        expect(@stack.length).to eq(1)
      end

      it 'should return the last item inserted' do
        expect(@stack.pop).to eq('Andrew')
      end

      it 'should allow peeking the next item' do
        @stack.pop
        expect(@stack.peek).to eq('Jeffrey')
      end

      it 'should allow popping the next item' do
        @stack.pop
        expect(@stack.pop).to eq('Jeffrey')
      end
    end
  end
  
end