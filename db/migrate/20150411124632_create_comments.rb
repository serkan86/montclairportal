class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.references :user, index: true
      t.text :content

      t.timestamps null: false
    end
  end
end
