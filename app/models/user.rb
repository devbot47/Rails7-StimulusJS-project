class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :first_name, presence: true

  has_one :employee
end
