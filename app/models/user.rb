class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :comments
  has_many :posts

  devise :database_authenticatable, :registerable

  before_save { |user| user.login = login.downcase }

  validates :login,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates_presence_of :password, on: :create
  validates :password,
            length: 8..50,
            format: { with: /^(?=.*[A-Z])(?!.*[^a-zA-Z0-9]).+$/ },
            confirmation: true,
            if: :password_exists?

  def password_exists?
    password.present?
  end

  attr_accessible :login, :first_name, :last_name, :password, :password_confirmation, :admin

end
