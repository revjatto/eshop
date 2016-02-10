class Product < ActiveRecord::Base
   
def available?
 self.stock > 0
end


def buy_by(user)
     if available?
     user.products << self
     self.stock -= 1
     #Add product to user's history
     save
     end
end
end