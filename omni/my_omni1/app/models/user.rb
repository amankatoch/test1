class User

  include Mongoid::Document
  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.welcome_email(@user).deliver
  end
  handle_asynchronously :send_admin_mail , :run_at => Proc.new { 1.minutes.from_now } 

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
     
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  

  
  
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        
      end
  end


  def serialize_from_session(key, salt)
    record = to_adapter.get(key[0]['$oid'])
    record if record && record.authenticatable_salt == salt
  end



end
