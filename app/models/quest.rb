class Quest < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :description, :requirement ],
    using: {
      tsearch: { prefix: true }
    }
end
