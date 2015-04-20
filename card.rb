class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end

	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

	# def self.random_card
	# 	Card.new(rand(10), :spades)
	# end
end

class Deck
	def initialize
		@cards = []
		# @cards << Card.new(10, :spades)
		# @cards << Card.new(9, :diamonds)
		# I didn't like the idea of typing out 52 cards
		# with the above method so I opted to build them
		# by looping through 2 arrays.
		ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
		suits = %w{Spades Hearts Diamonds Clubs}
			suits.each do |suit|
  				ranks.size.times do |i|
    				@cards << Card.new( ranks[i], suit )
  				end
			end
	end

	def shuffle
		@cards.shuffle!
	end

	def output
		@cards.each do |card|
			card.output_card
		end
	end

	def deal
		@cards.shift.output_card
	end
end

deck = Deck.new
deck.shuffle
deck.output
deck.deal

# So each time I run this it's creating a new deck
# then it shuffles the new deck and outputs the
# first card from the deck, but doesn't keep the 
# deck in memory. 
# So I need a way to create a new deck once and 
# deal the first card, then reshuffle the remaining
# cards until there are no more cards to deal