class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image
  # def email_required?
  # 	false
  # end

  # def email_changed?
  # 	false
  # end

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: { minimum: 2, maximum: 20}, uniqueness: { case_sensitive: false}
  validates :introduction, length: {maximum: 50}

end
