class Hand
  require_relative 'card'
  attr_accessor :delt_cards

  VALUES = {
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'Jack': 10,
    'Queen': 10,
    'King': 10,
    'Ace': 1
  }

  def initialize
    @delt_cards = []
  end

  def add_card(card)
    @delt_cards << card
  end

  def get_value
    card_ranks = @delt_cards.map { |card| card.rank }
    result = card_ranks.reduce(0) {|acc, rank| acc + VALUES[rank.to_sym]}
    if card_ranks.include?("Ace") && @delt_cards.first.show
      result += 10 if result + 10 <= 21
    end
    result
  end

  def to_s
    report = ""

    delt_cards.each {|card| report += card.to_s + ", " if card.show}

    if delt_cards.first.show == false
      first_value = VALUES[@delt_cards.first.rank.to_sym]
      report + "Total value: " + (get_value - first_value).to_s
    else
      report + "Total value: " + get_value.to_s
    end
  end

end
