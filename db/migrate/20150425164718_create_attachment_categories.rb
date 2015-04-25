class CreateAttachmentCategories < ActiveRecord::Migration
  def change
    create_table :attachment_categories do |t|
      t.string :name

      t.timestamps
    end

    AttachmentCategory.create(name: 'Useful Videos')
    AttachmentCategory.create(name: 'Previous Exam Questions')
    AttachmentCategory.create(name: 'Assignment Solutions')
    AttachmentCategory.create(name: 'Other')
  end
end
