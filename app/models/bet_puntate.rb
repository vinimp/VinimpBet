class BetPuntate < ActiveRecord::Base
	belongs_to :user	
	belongs_to :bet

	attr_accessible :user, :bet, :evento_scommesso, :evento_scommesso, :chiusura
end
