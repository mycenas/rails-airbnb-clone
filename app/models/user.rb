class User < ApplicationRecord
  has many: quests, foreign_key: :user_id, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
