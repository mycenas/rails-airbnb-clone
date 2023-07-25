class Booking < ApplicationRecord
  belongs_to :quest
  belongs_to :user
end
