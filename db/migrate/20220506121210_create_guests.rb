class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.boolean :attending
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :city_state
      t.string :zipcode
      t.boolean :reminders
      t.boolean :birth_alert
      t.boolean :see_photos

      t.timestamps
    end
  end
end
