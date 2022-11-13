class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.belongs_to :user
      t.datetime :date_started
      t.datetime :date_employment_ended
      t.timestamps
    end
  end
end
