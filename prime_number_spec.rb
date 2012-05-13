#PrimeNumber spec
require './prime_number'
describe PrimeNumber do
  
  describe 'Class method' do
    describe 'generate()' do
      it 'should return so many numbers as argument specify' do
        PrimeNumber.generate(10).count.should == 10
      end
      it 'shuld return only prime numbers' do
       PrimeNumber.generate(11).should == ('2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31'.split(', '))
      end
      it 'returned numbres should be uniq' do
        PrimeNumber.generate(10)
      end
    end
  end

  describe 'initialize' do
    xit 'should set first 10 numbers by default'
  end

  describe 'generate_times_table' do

  end

end
