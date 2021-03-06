class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :username, presence: true
         validates :email, presence: true
         validates_uniqueness_of :username, :email

         has_many :articles
         has_many :comments
         
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "http://i.imgur.com/qIMxAcFs.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
