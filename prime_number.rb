#!ruby

class PrimeNumber
  class << self 
    def generate(how_much)
      how_many_decount = how_much
      array_of_primes=[2,3] #these two are magic numbers
      # I stole the logic for generating primes from  http://julesberman.blogspot.co.uk/2008/04/generating-prime-numbers-in-ruby-python.html
      state = Numeric.new
      (4..99999).each do |i|
         return array_of_primes[0..(how_much-1)] if how_many_decount < 1
         (2..(Math.sqrt(i).ceil)).each do |thing|
            state = 1
            if (i.divmod(thing)[1] == 0)
               state = 0
               break
            end
         end
         unless (state == 0)
           array_of_primes << i 
           how_many_decount -= 1
         end
      end
      return array_of_primes
    end
  end

  #instant methods
  attr_reader :prime_numbers

  def initialize(how_many=10)
    @prime_numbers = self.class.generate(how_many)
  end

  def print_times_table
    times_table = generate_times_table
    times_table.each do |row|
      row.each do |col|
        print printf( "%-4s",col)
      end
      print "\n"
    end
  end

private
  def generate_times_table
    times_table =[ ([nil] + prime_numbers) ] #first row
    @prime_numbers.each do |prime_number|
      row_array = [prime_number]
      prime_numbers.each do |col_prime_number|
        row_array << (col_prime_number * prime_number)
      end
      times_table << row_array
    end
    times_table
  end
end

