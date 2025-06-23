class CreateTechnicalData < ActiveRecord::Migration[7.2]
  def change
    create_table :technical_data do |t|
      t.references :product, null: false, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
