class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  def self.my_all
    all
  end

end
