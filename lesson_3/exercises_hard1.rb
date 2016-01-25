# Answer 1. What do you expect to happen when the greeting variable is
            # referenced in the last line of the code below?
  if false
    greeting = “hello world”
  end
  greeting
  # nil

# Answer 2. What is the result of the last line in the code below?
  greetings = { a: 'hi' }
  informal_greeting = greetings[:a]
  informal_greeting << ' there'

  puts informal_greeting  #  => "hi there"
  puts greetings # {a: 'hi'} or {:a=> 'hi'}


# Answer 3. What will be printed by each of these code groups?
  def mess_with_vars(one, two, three)
    one = two
    two = three
    three = one
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}" # "one is: one"
  puts "two is: #{two}" # "two is: two"
  puts "three is: #{three}" # "three is: three

  puts "--"

  def mess_with_vars(one, two, three)
    one = "two"
    two = "three"
    three = "one"
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}" # "one is: one"
  puts "two is: #{two}"  # "two is: two"
  puts "three is: #{three}" # "three is: three"

  puts "--"
  def mess_with_vars(one, two, three)
    one.gsub!("one","two")
    two.gsub!("two","three")
    three.gsub!("three","one")
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}" # "one is: two"
  puts "two is: #{two}"  # "two is: three"
  puts "three is: #{three}" # "three is: one"

  puts "--"

# Answer 4. Write a method that returns one UUID when called with no parameters.
  def generate_UUID
    characters = []
    (0..9).each { |digit| characters << digit.to_s }
    ('a'..'f').each { |digit| characters << digit }
    # generates a random string

    uuid = ""
    sections = [8, 4, 4, 4, 12]
    sections.each_with_index do |section, index|
      section.times { uuid += characters.sample }
      uuid += '-' unless index >= sections.size - 1
    end
    uuid
  end

p generate_UUID

# Answer 5. IP address fix


  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    return false unless dot_separated_words.size == 4

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
    end
     true
  end

  p dot_separated_ip_address?("32423.42.3432.4322")

