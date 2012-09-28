class ApplicationController < ActionController::Base
  protect_from_forgery
  
  class ActiveRecord::Base
   def self.none
     where(arel_table[:id].eq(nil).and(arel_table[:id].not_eq(nil)))
   end
  end
end
