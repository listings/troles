#
# @author Kristian Mandrup
#
# Single role strategy to save role as a boolean (1 bit) value : false (default) or true
# 
module Trole
  module Strategy
    module BitOne 
      #
      # What to add to the role subject class when this role strategy is included
      #
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      #
      def self.included(base)
        base.send :include, BaseOne
        base.valid_roles = [:user, :admin] # default binary roles 
      end

      # The storage strategy class
      # @return [Class] a storage subclass
      def storage 
        Troles::Storage::BitOne
      end      
    end
  end
end