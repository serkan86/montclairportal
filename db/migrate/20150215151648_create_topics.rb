class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.references :forum, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
