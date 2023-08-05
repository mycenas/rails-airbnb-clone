class ChangeMessageToBeStringInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :message, :string
  end
end
