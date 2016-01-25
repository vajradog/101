require 'pry'
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

puts "-----------"
prompt "You are #{PLAYER_MARKER}"
prompt "The Computer is #{COMPUTER_MARKER}"
puts "-----------"
# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "   |   |"
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts "   |   |"
  puts "-----------"
  puts "   |   |"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts "   |   |"
  puts "-----------"
  puts "   |   |"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts "   |   |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Enter a square number to mark: #{joinor(empty_squares(brd), ', ')} "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    if brd[5] == INITIAL_MARKER
      square = 5
    else
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    end
    break if square
  end

  # defence
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def place_piece!(brd, current_player)
  current_player == 'computer' ? computer_places_piece!(brd) : player_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 'computer' ? 'player' : 'computer'
end

def choose_first_move
  loop do
    prompt "Enter who will choose first: ('p' for player or 'c' for computer)."
    answer = gets.chomp.downcase
    case answer
    when 'p'
      break 'player'
    when 'c'
      break 'computer'
    else
      prompt "Please enter a valid choice."
    end
  end
end

loop do
  player_score = 0
  computer_score = 0
  current_player = choose_first_move

  loop do
    board = initialize_board

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    case detect_winner(board)
    when "Player"
      player_score += 1
    when "Computer"
      computer_score += 1
    end

    if someone_won?(board)
      prompt "#{detect_winner(board)} won."
      prompt "Current score is Computer: #{computer_score}, Player: #{player_score}"
    else
      prompt "it's a tie"
    end

    break if player_score == 5 || computer_score == 5
  end

  prompt "Final score is Computer: #{computer_score}, Player: #{player_score}"
  prompt "Press 'y' to play another round? "
  break if !gets.chomp.start_with?('y')
end

prompt "Thank you for playing tic tac toe"
