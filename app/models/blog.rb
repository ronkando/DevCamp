class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic


  enum status: {draft: 0, published: 1 }
  friendly_id :title, use: :slugged

   validates_presence_of :title , :body
  
  def self.my_all
    all
  end

end
