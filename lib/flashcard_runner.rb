card1 = Card.new("What does NBA stand for?", "National Basketball Association", :Sports)
card2 = Card.new("What does NFL stand for?", "National Football League", :Sports)
card3 = Card.new("What does MLB stand for?", "Major League Baseball", :Sports)
card4 = Card.new("What does roygbiv stand for?", "red orange yellow green blue indigo violet", :Colors)
card5 = Card.new("What three colors are on the american flag?" "red white blue", :Colors)
card6 = Card.new("What is the color of the shirt you are currently wearing?", "blue", :Colors)
card7 = Card.new("What is the name of the kind of phone Apple created?", "iphone", :Tech)
card8 = Card.new("Is backend development or frontend development focused more on building websites?", "frontend", :Tech)
card9 = Card.new("When was the first personal computer invented?", "1971", :Tech)

deck = Deck.new[card1, card2, card3, card4, card5, card6, card7, card8, card9]

round = Round.new(deck)

def start
  
end
