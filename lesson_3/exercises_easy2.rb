# Answer 1. see if there is an age present for "Spot".
  # What are two other hash methods that would work just as well for this solution?
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  p ages.assoc("Spot") #nil
  p ages.include?("Spot") #false
  p ages.key?("Spot") # false
  p ages.member?("Spot") # false

# Answer 2. Add up all of the ages from our current Munster family hash:
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts ages.values.inject(:+)
  puts ages.values.inject { |sum, n| sum + n } #inject

# Answer 3. throw out the really old people (age 100 or older).
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  puts ages.keep_if { |k,v| v < 100 } #keep_if


# Answer 4. Convert the string in the following ways (code will be executed on original munsters_description above):
  # "The munsters are creepy in a good way."
  # "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
  # "the munsters are creepy in a good way."
  # "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
  munsters_description = "The Munsters are creepy in a good way."
  puts munsters_description.capitalize
  puts munsters_description.swapcase # swapcase
  puts munsters_description.downcase
  puts munsters_description.upcase

# Answer 5. add ages for Marilyn and Spot to the existing hash
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }
  puts ages.merge!(additional_ages) # merge

# Answer 6. Pick out the minimum age from our current Munster family hash:
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts ages.values.min  #min
  puts ages.values.max #max

# Answer 7. See if the name "Dino" appears in the string below:
  advice = "Few things in life are as important as house training your pet dinosaur."
  p advice.include?("Dino")
  p advice.match("Dino")

# Answer 8. Find the index of the first name that starts with "Be"
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p flintstones.index("Betty")
  p flintstones.index{|x|x[0,2]=="Be"}  #=> 1

# Answer 9. Using array#map!, shorten each of these names to just 3 characters:
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p flintstones.map {|name| name[0..2] }

# Answer 10 is similar to 9
