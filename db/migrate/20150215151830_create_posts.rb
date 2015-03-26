class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :topic, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
