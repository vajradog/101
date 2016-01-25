# Answer 1. write a one-line program that creates the following output 10 times,
            # with the subsequent line indented 1 space to the right:
  10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Answer 2. Create a hash that expresses the frequency with which each letter occurs in this string:
  statement = "The Flintstones Rock"
  letters = ('A'..'Z').to_a + ('a'..'z').to_a
  result = {}
  letters.each do |letter|
    letter_frequency = statement.scan(letter).count
    result[letter] = letter_frequency if letter_frequency > 0
  end
  p result

# Answer 3. The result of the following statement will be an error:
            # Why is this and what are two possible ways to fix this?
    # puts "the value of 40 + 2 is " + (40 + 2)
    # error because it's a mix of string and fixnum.

    # We can convert the resulting arithmetic to a string
    puts "the value of 40 + 2 is " + (40 + 2).to_s

# Answer 4. What happens when we modify an array while we are iterating over it? What would be output by this code?
  numbers = [1, 2, 3, 4]
  numbers.each do |number|
    p number
    numbers.shift(1)
  end
  # 1,3
  puts "--"
  # What would be output by this code?
  numbers = [1, 2, 3, 4]
  numbers.each do |number|
    p number
    numbers.pop(1)
  end
  # 1,2

# Answer 5.
  def factors(number)
    dividend = number
    divisors = []
    while dividend > 0 # executes when conditional is true
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end until dividend == 0
    divisors
  end

  p factors(20)
  # What is the purpose of the number % dividend == 0 ?
  # Answer: Makes sure there is no remainder. 16%2 == 0

  # What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
  # Answer: It is to return the final divisors (result). Without this the code would execute but return nil

# Answer 7:
  limit = 15 # this is useless. The block cannot access it

  def fib(first_num, second_num)
    limit = 15
    while second_num < limit
      sum = first_num + second_num
      first_num = second_num
      second_num = sum
    end
    sum
  end

  result = fib(0, 1)
  puts "result is #{result}"

# Answer 8: titleize implementation
  def titleize(words)
    words.split.map {|word| word.capitalize }.join(" ") # use of split, map, capitalize and join
  end

  p titleize("this is a beautiful day")

# Answer 9:
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 11, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  munsters.each do |name, details|
    case details["age"]
    when 0..18
      details["age_group"] = "kid"
    when 18..65
      details["age_group"] = "adult"
    else
      details["age_group"] = "senior"
    end
  end
  p munsters
