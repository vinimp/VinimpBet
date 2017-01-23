class Bet < ActiveRecord::Base
	belongs_to :user

	has_attached_file :logo_in, styles: { medium: "300x>", thumb: "10x>" }
  validates_attachment_content_type :logo_in, content_type: /\Aimage\/.*\z/

  has_attached_file :logo_out, styles: { medium: "300x>", thumb: "10x>" }
  validates_attachment_content_type :logo_out, content_type: /\Aimage\/.*\z/
end
