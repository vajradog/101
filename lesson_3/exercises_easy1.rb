#Answer 2
#! can mean many things. Not operator. It's also a modifier.
#? Ternary if-then-else. Conditional expression which returns a boolean value
  username = "Anthony"
  name = "Johnny"

  #1 !=
  if username != name
    puts "they are not the same"
  else
    puts "they are the same"
  end

  #2 !variable
  if !username.nil?
    puts "usersname is not empty"
  end

  # 3
  x = %w(tea tea coffee soda soda)
  x.uniq! # modifies the array
  puts x

  # 4 put ? before something
  # It returns a single character string. It is the shortest way to write a single-character string literal.
  puts ?s

  # 5. put ? after something
  if username.empty?
    puts "they are not the same"
  else
    puts "they are the same"
  end

  # 6 !! is not NOT. Used to convert a value to a boolean
  if !!username == name
    puts "they are the same"
  else
    puts "they are not the same"
  end

# Answer 3
  # Replace the word "important" with "urgent" in this string:
  advice = "Few things in life are as important as house training your pet dinosaur."
  puts advice.gsub!('important', 'urgent')

# Answer 4
  # The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
  numbers = [1, 2, 3, 4, 5]
  numbers.delete_at(1)
  puts numbers # this will delete the number at position 1, in this case it is the number 2
  puts "--"
  numbers = [1, 2, 3, 4, 5]
  numbers.delete(1) # this will delete the actual number 1. Not the position
  puts numbers

# Answer 5
  # Programmatically determine if 42 lies between 10 and 100.
  puts "yes" if (10..100).cover?(40)
  puts "yep" if (10..100).include?(40)

# Answer 6
  # show two different ways to put the expected "Four score and " in front of it.
  famous_words = "seven years ago..."
  # a
  puts "Four score and " + famous_words
  # b
  append_words = "Four score and "
  puts append_words << famous_words
  # c
  append_words = "Four score and "
  puts famous_words.prepend(append_words)

# Answer 7
  def add_eight(number)
    number + 8
  end

  number = 2

  how_deep = "number"
  5.times { how_deep.gsub!("number", "add_eight(number)") }
  p eval(how_deep)
  p how_deep

# Answer 8. Make this into an un-nested array.
  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]
  p flintstones.flatten!

# Answer 9. Turn this into an array containing only two elements: Barney's name and Barney's number
  names = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  p names.assoc("Barney")


