class Quest < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
#SEND TO BRIAN HERE
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :description, :reward, :requirement ],
    using: {
      tsearch: { prefix: true }
    }
#SEND TO BRIAN HERE
  end
