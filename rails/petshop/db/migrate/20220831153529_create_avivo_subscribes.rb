class CreateAvivoSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :avivo_subscribes do |t|
      t.references :usuario, null: false, foreign_key: true
      t.integer :tipo_campeonato

      t.timestamps
    end
  end
end
