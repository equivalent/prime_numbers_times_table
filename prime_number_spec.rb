#PrimeNumber spec
require './prime_number'
describe PrimeNumber do
  
  describe 'Class method' do
    describe 'generate()' do
      it 'should return so many numbers as argument specify' do
        PrimeNumber.generate(10).count.should == 10
      end
      it 'shuld return only prime numbers' do
       PrimeNumber.generate(11).should == ('2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31'.split(', ').collect(&:to_i))
      end
      it 'returned numbres should be uniq' do
        PrimeNumber.generate(10)
      end
    end
  end

  describe 'initialize' do
    it 'should call PrimeNmuber.generate once' do
      PrimeNumber.should_receive(:generate).once.with(11)
      PrimeNumber.new(11)
    end
    it 'should set first 10 numbers by default' do
      PrimeNumber.should_receive(:generate).once.with(10)
      PrimeNumber.new
    end
  end

  describe 'generate_times_table' do
    context 'when dealing with 10 numbers' do
      xit 'should output table with 11 rows and 11 colls'
      # 11 because 10 as times table and 1 header what prime number I'm doing math with
      xit 'first items in row should be prime'
      xit 'first items in coll should be prime'
      xit 'items inside times table sould be muliplied'
      xit 'should print coll value with tabulators'
    end
  end

end
