class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender
      t.integer :receiver

      t.timestamps
    end
  end
end
