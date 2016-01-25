# Answer 1. Figure out the total age of just the male members of the family.
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" }
  }

  total_male_age = 0
  munsters.each do |name, details|
    total_male_age += details["age"] if details["gender"] == "male"
  end
  p total_male_age

  puts "--"


# Answer 2. Print out the name, age and gender of each family member:
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  munsters.each do |name, details|
    puts "#{name} is a #{details["age"]} years old #{details["gender"]}"
    #puts name + " is a " + details["age"].to_s + " years old " + details["gender"]
  end

  puts "--"
# Answer 3. How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?
  def not_so_tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param += ["rutabaga"]

    return a_string_param, an_array_param
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  my_string, my_array = not_so_tricky_method(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"

# Answer 4. Break up the following string and put it back together with the words in reverse order:
  sentence = "Humpty Dumpty sat on a wall."
  words = sentence.split(/\W/)
  words.reverse!
  p backward_order = words.join(" ")


# Answer 5
  answer = 42
  def mess_with_it(some_number)
    some_number += 8
  end
  new_answer = mess_with_it(answer) # 42 + 8
  p answer - 8

# Answer 6
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  def mess_with_demographics(demo_hash)
    demo_hash.values.each do |family_member|
      family_member["age"] += 42
      family_member["gender"] = "other"
    end
  end

  mess_with_demographics(munsters)
  p munsters

  # Yes the family data is ransacked. Spot used the munsters hash for his demo_hash which modified the values permanently.

# Answer 7.

  def rps(fist1, fist2)
    if fist1 == "rock"
      (fist2 == "paper") ? "paper" : "rock"
    elsif fist1 == "paper"
      (fist2 == "scissors") ? "scissors" : "paper"
    else
      (fist2 == "rock") ? "rock" : "scissors"
    end
  end

  puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
  # paper


# Answer 8.
  def foo(param = "no")
    "yes"
  end

  def bar(param = "no")
    param == "no" ? "yes" : "no"
  end

  p bar(foo)


