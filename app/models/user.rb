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

  # following code added to try and fix 3rd party auth
    # has_many :authorizations
    
    # def add_provider(auth_hash)
    #     # Check if the provider already exists, so we don't add it twice
    #     unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    #         Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    #     end
    # end
    
    #validates_uniqueness_of :email, :penname
    
    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
           user.provider = auth.provider
           user.uid = auth.uid
        #   user.email = SecureRandom.hex(9) #can use Faker gem to create fake email
            user.email =  Faker::Internet.email
           user.oauth_token = auth.credentials.token
           user.name = auth.info.name #need to figure out how to format this correctly 
           # ["nickname", "ghtjg"]
           # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
           if user.provider = 'twitter'
               user.password = SecureRandom.hex(9)
           end
           user.save!
        end
    end
    
end