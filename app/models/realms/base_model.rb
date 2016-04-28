module Realms
  class BaseModel < ActiveRecord::Base
    # Can't instatiate this class
    self.abstract_class = true

    # Connect to the world database when working with world models
    establish_connection DB_REALM
  end
end
