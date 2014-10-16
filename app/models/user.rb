class User < ActiveRecord::Base
	extend FriendlyId
  mount_uploader :avatar, AvatarUploader
	friendly_id :username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]  ## ------- check --- maybe login??

  validates :username, uniqueness: { :case_sensitive => false }, 
  						format: { with: /\A[a-zA-Z0-9]+\Z/ }, 
  						exclusion: {:in => ["admin", "root", "test", "discover", "view", "find", "search", "list", "all", "post"],:message => "is reserved"},
  						length: {minimum: 3} 

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

end
