class BetPuntate < ActiveRecord::Base
	belongs_to :user	
	belongs_to :bet
	belongs_to :classifica

	attr_accessible :user, :bet, :evento_scommesso, :user_id, :chiusura, :id, :n_giornata
end
