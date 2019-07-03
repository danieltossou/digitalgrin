class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[facebook]

  has_and_belongs_to_many :fields
  
  has_many :messages
  has_many :comments
  has_many :posts
  has_many :responses

  acts_as_target

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.picture = auth.info.image # assuming the user model has an image
      user.gender = auth.info.user_gender 
      user.date_of_birth = auth.info.user_birthday   
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  after_update do
    puts"============================================================"
    # User.fields.create!(field_id: :field_ids, user_id: current_user.id)
    puts"============================================================"
  end

end
