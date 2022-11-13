class Employee < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :date_started, presence: true
  validates :date_employment_ended, presence: true
end
