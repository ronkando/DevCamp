class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title , :body , :main_image , :tumbe_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfoio_items , -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image  ||=  Placeholder.image_placeholder_generator(height:'600' , width: '400')
    self.tumbe_image ||=  Placeholder.image_placeholder_generator(height:'350' , width: '200')
  end
end