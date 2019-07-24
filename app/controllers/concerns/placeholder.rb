module Placeholder
  extend ActiveSupport::Concern

  def self.image_placeholder_generator(height: , width:)
    "https://via.placeholder.com/#{height}x#{width}"
  end
end