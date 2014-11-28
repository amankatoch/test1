class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin,:digitalocean, :google]

  field :provider, type: String
  field :uid, type: String
  field :email, type: String
  field :password ,type: String
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        
      end
  end
end