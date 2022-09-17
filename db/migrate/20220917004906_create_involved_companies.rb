class CreateInvolvedCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :involved_companies do |t|
      t.references :company, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :developer
      t.boolean :publisher

      t.timestamps
    end

    add_index :involved_companies, [ :company_id, :game_id ], unique: true
  end
end
