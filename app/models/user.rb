class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :scores

  validates :name,
    presence: true,
    length: { maximum: 32 }
  validates :email,
    length: { maximum: 255 }
    # presence, email-format are already devise validated
  validates :password,
    length: { maximum: 32 }
    # presense, minimum 8 are already devise validated
end
