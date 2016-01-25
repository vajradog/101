# Answer 1. Show an easier way to write this array:
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
  p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Answer 2. How can we add the family pet "Dino" to our usual array:
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p flintstones << "Dino"
  # p flintstones.push("Dino")


# Answer 3. How can we add multiple items to our array? (Dino and Hoppy)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p flintstones.push("Dino").push("Hoppy")

# Answer 4. Shorten this sentence: remove everything starting from "house".
  advice = "Few things in life are as important as house training your pet dinosaur."
  p advice.slice!(0, advice.index("house"))
  p advice

# Answer 5. Write a one-liner to count the number of lower-case 't' characters in the following string:
  statement = "The Flintstones Rock!"
  p statement.scan("t").count # scan

# Answer 6. Back in the stone age (before CSS) we used spaces to align things on the screen.
            # If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?
  title = "Flintstone Family Members"
  puts title.center(40)














