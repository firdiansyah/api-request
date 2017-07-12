class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :unit

      t.timestamps
    end
  end
end
