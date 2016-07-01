class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :photo
      t.string :video
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
