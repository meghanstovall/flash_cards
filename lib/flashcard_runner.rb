require './lib/card'
require './lib/deck'
require './lib/round'

card1 = Card.new("What does NBA stand for?", "National Basketball Association", :Sports)
card2 = Card.new("What does NFL stand for?", "National Football League", :Sports)
card3 = Card.new("What does MLB stand for?", "Major League Baseball", :Sports)
card4 = Card.new("What does roygbiv stand for?", "red orange yellow green blue indigo violet", :Colors)
card5 = Card.new("What three colors are on the american flag?", "red white blue", :Colors)
card6 = Card.new("What is the color of the shirt you are currently wearing?", "blue", :Colors)
card7 = Card.new("What is the name of the kind of phone Apple created?", "iphone", :Tech)
card8 = Card.new("Is backend development or frontend development focused more on building websites?", "frontend", :Tech)
card9 = Card.new("When was the first personal computer invented?", "1971", :Tech)

@deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9])
@deck_count = 9
@round = Round.new(@deck)

def start
  puts "Welcome, you're playing with #{@deck.cards.count} cards"
  puts "------------------------------------------------------"

  until @round.turns.count == @deck_count do
    puts "This is card number #{@round.turns.count + 1} out of #{@deck_count}"
    puts "Question: #{@round.current_card.question}"

    user_answer = gets.chomp

    user_turn = @round.take_turn(user_answer)
    user_turn.feedback
  end

  results
end

def results
  puts "****** Game over! ******"
  puts "You had #{@round.total_correct} correct guess out of #{@deck.cards.count} for a total score of #{@round.percent_correct}%"
  # Each loop to make sure i dont print multiples of the same category?
  puts "Sports - #{@round.percent_correct_by_cat(:Sports)}% correct"
  puts "Colors - #{@round.percent_correct_by_cat(:Colors)}% correct"
  puts "Tech - #{@round.percent_correct_by_cat(:Tech)}% correct"

end

start
