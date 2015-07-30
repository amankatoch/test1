class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :course, index: true
      t.string :full_name
      t.string :company
      t.string :email
      t.string :telephone
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.string :card_number
      t.string :card_verification
      t.date :card_expires_on
      t.timestamps
    end
  end
end
