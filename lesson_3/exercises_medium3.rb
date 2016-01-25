def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# Answer 4.
  def tricky_method_two(a_string_param, an_array_param)
    a_string_param.gsub!('pumpkins', 'rutabaga')
    an_array_param = ['pumpkins', 'rutabaga']
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  tricky_method_two(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"

  # My string looks like this now: rutabaga
  # My array looks like this now: ["pumpkins"]

# Answer 5. How could the unnecessary duplication in this method be removed?
def color_valid(color)
  color == "blue" || color == "green"
end
