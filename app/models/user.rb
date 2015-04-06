class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        has_one :user_profile
        accepts_nested_attributes_for :user_profile

  has_many :topics
  has_many :posts

  validates_presence_of :name

  has_many :blogs

  has_attached_file :avatar, :styles => { micro_thumb: '50x50#', medium: '500x500>', thumb: '100x100#', small: '150x150#'}, default_url: ':style_profile.gif'

  validates_attachment_content_type :avatar,
                                    content_type: ['image/jpeg', 'image/png', 'image/jpg'],
                                    message: 'Sadece jpg, png resim dosylarını yükleyebilirsiniz.'

end
