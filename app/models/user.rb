class User < ApplicationRecord
  include Clearance::User

  # validation via phonelib
  validates :phone_number, phone: true
end
