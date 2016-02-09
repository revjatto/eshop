class Product < ActiveRecord::Base
    
def buy
     self.stock -= 1
     #Add product to user's history
     self.save
end
end
