# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  name                :string
#  email               :string
#  school_or_workplace :string
#  technical_expertise :text
#  still_learning      :text
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  password_digest     :string
#

class User < ActiveRecord::Base
    has_many :userblogs
    has_secure_password
    attr_accessible :name, :email, :password, :password_confirmation, :school_or_workplace, :technical_expertise, :still_learning
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
