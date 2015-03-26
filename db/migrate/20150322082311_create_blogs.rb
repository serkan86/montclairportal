class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.references :user, index: true
      t.text :content
      t.string :slug

      t.timestamps
    end
  end
end
