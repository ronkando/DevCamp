class Portfolio < ApplicationRecord
  validates_presence_of :title , :body , :main_image , :tumbe_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfoio_items , -> { where(subtitle: 'Ruby on Rails')}
end
