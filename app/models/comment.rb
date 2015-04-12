class Comment < ActiveRecord::Base

  belongs_to :user

  belongs_to :commentable, polymorphic: true

  include PublicActivity::Model
  tracked owner: :set_activity_owner

  validates_presence_of :content

  default_scope -> {order('id DESC')}

  def set_activity_owner
    self.user
  end

end
