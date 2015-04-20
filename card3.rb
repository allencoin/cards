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

puts "Cards shuffled. Type \"deal\" to deal a card."

print "> "
deal = $stdin.gets.chomp

if deal == "deal"
	puts "#{deck.deal}"
	# puts "#{deck.count} cards left. Deal again?"
	# if deck.count > 0
	# 	puts "Deal again?"
	# 	print "> "
	# 	deal = $stdin.gets.chomp
	# else
	# 	puts "Game over."
	# end

else 
	puts "Type \"deal\" to deal a card."
	# print "> "
	# deal = $stdin.gets.chomp
end

# Okay, here's what I want this to do. I want this to be kind
# of like a choose-your-own adventure game. I want to call
# card2.rb and have it create a deck of cards. I want to be 
# able to type 'deal' and have it deal a card from the deck of 
# cards, delete it, and tell me how many cards are left.
# so, like:
# 
# $ > deal
# 9 of Spades
# 51 cards left. Deal again?
# $ > deal
# Queen of Hearts
# 50 cards left. Deal again?