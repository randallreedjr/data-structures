describe LinkedList do
  before :each do
    @list = LinkedList.new
  end

  context 'empty list' do
    it 'should have length 0 when initialized' do
      expect(@list.length).to eq(0)
    end

    it 'should return nil when peeking' do
      expect(@list.peek).to be(nil)
    end

    it 'should return nil when popping' do
      expect(@list.pop).to be(nil)
    end
  end

  context 'inserting one item' do
    before :each do
      @list.push('Randall')
    end
    it 'should update length' do
      expect(@list.length).to eq(1)
    end

    context 'peek' do
      it 'should return object' do
        expect(@list.peek).to eq('Randall')
      end

      it 'should not change list length' do
        @list.peek
        expect(@list.length).to eq(1)
      end
    end

    context 'pop' do
      it 'should return object' do
        expect(@list.pop).to eq('Randall')
      end

      it 'should decrement list length' do
        @list.pop
        expect(@list.length).to eq(0)
      end
    end
  end

  context 'inserting multiple items' do
    before :each do
      @list.push('Jeffrey')
      @list.push('Andrew')
    end

    it 'should update length' do
      expect(@list.length).to eq(2)
    end

    context 'peek' do
      it 'should return the first item inserted' do
        expect(@list.peek).to eq('Jeffrey')
      end
    end

    context 'pop' do
      it 'should update length' do
        @list.pop
        expect(@list.length).to eq(1)
      end

      it 'should return the first item inserted' do
        expect(@list.pop).to eq('Jeffrey')
      end

      it 'should allow peeking the next item' do
        @list.pop
        expect(@list.peek).to eq('Andrew')
      end

      it 'should allow popping the next item' do
        @list.pop
        expect(@list.pop).to eq('Andrew')
      end
    end
  end

  context 'each' do
    context 'iterate empty list' do
      it 'should return the original object' do
        expect(@list.each{|n|}).to eq(@list)
      end

      it 'should accept a block and perform action on each item' do
        names = ''
        @list.each {|n| names += n}
        expect(names).to eq('')
      end
    end

    context 'iterate list with items' do
      before :each do
        @list.push('Randall')
        @list.push('Jeffrey')
        @list.push('Andrew')
      end

      it 'should return the original object' do
        expect(@list.each{|n|}).to eq(@list)
      end

      it 'should accept a block and perform action on each item' do
        names = ''
        @list.each {|n| names += n}
        expect(names).to eq('RandallJeffreyAndrew')
      end
    end
  end
end