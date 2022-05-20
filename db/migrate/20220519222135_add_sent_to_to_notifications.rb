class AddSentToToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :sent_to, :string
  end
end
