class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable
         
         attr_accessor :password
         
         validates :name, :email, presence: true 
         validates :email, uniqueness: true
         #validates :email, format: {with: /\A\z/}
         validates :password, presence: true
         
         
         before_save :encrypt_password, if: -> { self.password.present? }
         
         
    def self.authenticate(email, password) 
      if email.present? && password.present?
        if user = User.find_by(email: email)
          if user.valid_password?(password)
            user
          end
        end
      end
    end
  def valid_password(password)
    self.encrpted_password == Digest::MDS.hexdigest(password)
  end
  
  def encrypt_password
   # self.encrypted_password == Digest::MDS.hexdigest(password)
  end
end
