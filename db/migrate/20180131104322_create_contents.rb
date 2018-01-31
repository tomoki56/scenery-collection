class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end