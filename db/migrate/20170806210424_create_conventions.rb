class CreateConventions < ActiveRecord::Migration[5.0]
  def change
    create_table :conventions do |t|
      t.string      :name
      t.date        :start_date
      t.date        :end_date
      t.belongs_to  :city, index: true

      t.timestamps
    end
  end
end
