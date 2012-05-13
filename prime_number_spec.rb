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

    it 'should set @prime_numbers with Array of primes' do
      # I need to be 100% sure that's an array
      prime_instance=PrimeNumber.new(11)
      prime_instance.prime_numbers.should be_kind_of( Array)
      prime_instance.prime_numbers.count.should be 11
    end
  end

  describe 'generate_times_table' do
    context 'when dealing with 10 numbers' do
      let(:prime_instance){PrimeNumber.new(10)}
      let(:times_table_array){ prime_instance.send(:generate_times_table) }

      it 'should be array of arrays' do
        times_table_array.should be_kind_of(Array)
        times_table_array.each do |row|
          row.should be_kind_of(Array)
        end
      end
      it 'generated table array should be with 11 rows and 11 colls' do
      # 11 because: 10cols/rows as times table and 1row/coll header what prime number I'm doing math with
        times_table_array.count.should be 11
        times_table_array.each do |row|
          row.count.should be 11
        end
      end

      it 'first coll in first row should be nil' do
        times_table_array[0][0].should be_nil
      end

      it 'first coll in row should be prime' do
        first_col_array = []
        times_table_array.each do |row|
          first_col_array << row[0]
        end
        first_col_array.should == [nil, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      end

      it 'first row should contain primes in colls' do
        times_table_array[0].should == [nil, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      end

      it 'items inside times table sould be muliplied' do
        times_table_array[1].should == [2, 4, 6, 10, 14, 22, 26, 34, 38, 46, 58] # 2 *
        times_table_array[2].should == [3, 6, 9, 15, 21, 33, 39, 51, 57, 69, 87] # 3 
        times_table_array[3].should == [5, 10, 15, 25, 35, 55, 65, 85, 95, 115, 145] # 5 * 
        times_table_array[10].should == [29, 58, 87, 145, 203, 319, 377, 493, 551, 667, 841] # 29 *
      end

    end
  end

  describe 'print_times_table' do
    it 'should call generate_times_table' do
      instance = PrimeNumber.new
      instance.should_receive(:generate_times_table).once.and_return([[nil]])
      instance.print_times_table
    end
  end
end
