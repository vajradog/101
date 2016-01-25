SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
MAX_POINT = 21
STAY_POINT = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.each { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_POINT
  end

  sum
end

def busted?(cards)
  total(cards) > MAX_POINT
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAX_POINT
    :player_busted
  elsif dealer_total > MAX_POINT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

player_score = 0
dealer_score = 0

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def score_and_reset
  prompt "Final Score Player: #{player_score}, Dealer: #{dealer_score}"
  dealer_score = 0 && player_score = 0
end

loop do
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    dealer_score += 1
    if dealer_score == 5 || player_score == 5
      score_and_reset
      play_again? ? next : break
    end
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= STAY_POINT

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  dealer_total = total(dealer_cards)

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_cards, player_cards)
    player_score += 1
    if dealer_score == 5 || player_score == 5
      score_and_reset
      play_again? ? next : break
    end
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  display_result(dealer_cards, player_cards)
  if detect_result(dealer_cards, player_cards) == :player
    player_score += 1
  elsif detect_result(dealer_cards, player_cards) == :dealer
    dealer_score += 1
  end

  if dealer_score == 5 || player_score == 5
    prompt "Final Score Player: #{player_score}, Dealer: #{dealer_score}"
    dealer_score = 0 && player_score = 0
    break unless play_again?
  end
end

prompt "Thank you for playing Twenty-One! Good bye!"
