class Post < ActiveRecord::Base
  audited
  belongs_to :topic
  belongs_to :user
  validates_presence_of :content
  validates_presence_of :topic_id
  validates_presence_of :user_id
end
