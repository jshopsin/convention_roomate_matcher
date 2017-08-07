class CreateConventionsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :convention_users do |t|
      t.date        :check_in
      t.date        :check_out
      t.belongs_to  :user, index: true
      t.belongs_to  :convention, index: true

      t.timestamps
    end
  end
end
