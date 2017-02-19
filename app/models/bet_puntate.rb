class BetPuntate < ActiveRecord::Base
	belongs_to :user	
	belongs_to :bet
	belongs_to :classifica

	attr_accessible :user, :bet, :evento_scommesso, :evento_scommesso, :chiusura
end
