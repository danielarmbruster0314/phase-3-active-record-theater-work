class Audition < ActiveRecord::Base
  belongs_to :role

  def role 
    self.role 
  end 

  def call_back
    if self.hired == true
        self.save 
    else 
        self.update(hired: true)
    end
  end
end