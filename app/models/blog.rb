class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged
  def self.my_all
    all
  end
 validates_presence_of :tile , :body
end
