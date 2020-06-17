class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable 

  has_many :oppourtunities 

  mount_uploader :image, ProfilePictureUploader

  def full_name
    "#{first_name} #{last_name}"

  end


end
