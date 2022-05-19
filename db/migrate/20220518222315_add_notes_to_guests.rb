class AddNotesToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :notes, :text
  end
end
