class Event < ActiveRecord::Base
  validates :e_address, presence: true
  belongs_to :users
end
