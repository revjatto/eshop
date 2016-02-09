class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable
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
    self.encripted_password ==Digest::MDS.hexdigest(password)
  end
end
