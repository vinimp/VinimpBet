class AddAttachmentLogoInLogoOutToBets < ActiveRecord::Migration
  def self.up
    change_table :bets do |t|
      t.attachment :logo_in
      t.attachment :logo_out
    end
  end

  def self.down
    remove_attachment :bets, :logo_in
    remove_attachment :bets, :logo_out
  end
end
