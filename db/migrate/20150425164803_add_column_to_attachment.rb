class AddColumnToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :attachment_category, index: true
  end
end
