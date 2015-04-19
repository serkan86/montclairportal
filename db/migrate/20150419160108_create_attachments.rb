class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.attachment :file

      t.timestamps
    end
  end
end
