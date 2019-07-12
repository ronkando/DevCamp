class Blog < ApplicationRecord
  def self.my_all
    all
  end

  def print_me
    puts "hello"
  end
end
