class Attachment < ActiveRecord::Base
  audited

  belongs_to :attachment_category
  belongs_to :user

  has_attached_file :file

  validates_presence_of :title, :file, :attachment_category_id


  validates_attachment_size :file, in: 0.megabytes..2.megabytes

  validates_attachment_content_type :file,
                                    content_type: ['application/pdf', 'application/zip', 'application/gzip', 'text/csv', 'image/jpeg', 'image/png', 'image/jpg', 'application/vnd.oasis.opendocument.text', 'application/vnd.oasis.opendocument.presentation', 'application/vnd.oasis.opendocument.spreadsheet', 'application/vnd.oasis.opendocument.graphics', 'application/vnd.ms-excel', 'application/vnd.ms-powerpoint', ''],
                                    message: 'Invalid format'
end
