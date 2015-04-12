class Blog < ActiveRecord::Base
  belongs_to :user

  include PublicActivity::Model
  tracked owner: :set_activity_owner

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :content

  def set_activity_owner
    self.user
  end
end
