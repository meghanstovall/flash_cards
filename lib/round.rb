require './lib/turn'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    #@num_correct_by_cat = Hash.new(0)
    #@num_asked_per_cat = Hash.new(0)
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def total_correct
    total_correct = @turns.find_all do |turn|
      turn.correct?
    end
    return total_correct.count
  end

  def num_correct_by_cat(category)
    num_correct_by_cat = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    return num_correct_by_cat.count
  end

  def percent_correct
    (total_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_cat(category)
    percent_correct_by_cat = @turns.find_all do |turn|
      turn.card.category == category
    end
    (num_correct_by_cat(category).to_f / @turns.count.to_f) * 100
  end
end
