class Event < ActiveRecord::Base
  validates :e_address, presence: true
end
