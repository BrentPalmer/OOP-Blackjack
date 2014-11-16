

# Game starts with dealer passing card to player,
# then himself (does this twice until both player and dealer has 2 cards).
# Player and dealer checks their cards to see if they have 21
# if player has 21 the it is a BLACKJACK palyer wins, unless dealer has 21, then push
# dealer checks if he has 21, if so then dealer wins
# if player does not have 21 then player can 'hit' (goal is to reach 21)
# if player goes past 21 he loses 'busted'
# if player 'stays' then it is the dealers turn to 'hit' or 'stay'
# if the dealer has less than 17 then he has to 'hit' if more than 17 then he stays
# if dealer goes past 21 he busts
# after both players stay they compare cards, and the one with the closest value to
# 21 wins!

class Card 
  attr_accessor :value, :suit

  def initialize(suit,value)
    @value = value
    @suit = suit
  end

  def output
    puts "The #{value} of #{suit}."
  end

  def to_s
    output
  end
end



class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ["Hearts", "Diamonds", "Clubs", "Spades"].each do |suit|
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |value|
        @cards << Card.new(suit,value)
      end
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end



module Hand

  def show_hand
    puts "---#{name}'s hand---"
    cards.each do |cards|
      "=> #{cards}"
    end
    puts "=> Total: #{total}"
  end

  def total
    value = cards.map {|card| card.value}

    total = 0
    value.each do |val|
      if val == "A"
        total += 11
      elsif val.to_i == 0
        total += 10
      else
        total += val.to_i
      end
    end

    value.select{|e| e == "A"}.count.times do
      if total > 21
        total -= 10
      end
    end
    total
  end

  def add_card(new_card)
    cards << new_card
  end
end



class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def show_flop
    show_hand
  end
end



class Dealer
  include Hand

   attr_accessor :name, :cards

  def initialize
    @name = "dealer"
    @cards = []
  end

  def show_flop
    show_hand
  end
end



class Game_Engine
  attr_accessor :deck, :player, :dealer
  def initialize
    @deck = Deck.new
    @player = Player.new("Brent")
    @dealer = Dealer.new
  end

  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def play
    deal_cards
    player.show_flop
    dealer.show_flop
    #-Check for Blackjack
    #-Players turn
    #-Dealers turn
    #-Compare hands
    #-Announce winner
    #-Play again?

  end
end



game = Game_Engine.new
game.play





