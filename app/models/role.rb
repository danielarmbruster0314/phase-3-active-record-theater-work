class Role < ActiveRecord::Base 
    has_many :auditions


    def auditions
        self.auditions.all
    end 

    def actors 
        self.auditions.map do |audition|
            audition.actor
        end
    end 

    def locations 
        actor_locations =  []
        self.auditions.each  do |audition|
            actor_locations << audition.location
        end 
        return actor_locations
    end 

    def understudy

        result_array = self.auditions.filter do |audition|
            audition.hired == true
        end 


        if (result_array.size != 0 && result_array.size > 1)
            return result_array.second 
        else 
            return 'no actor has been hired for understudy for this role'
        end 
    end 
end 