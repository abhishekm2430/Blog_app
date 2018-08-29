module Ability
  class Person
    def self.can_do?(user1,user2)
      if(user1 == user2)
        return true
      else
        return false
      end
    end
  end
end

