module Trole
  module Storage
    class Generic
      attr_reader :role_subject

      def initialize role_subject
        @role_subject = role_subject
      end
  
      def valid_roles
        role_subject.class.valid_roles
      end        

      def name
        :generic
      end 
      
      def set_ds_field value
        role_subject.send(:"#{ds_field_name}=", value)
      end

      def ds_field_name
        role_subject.class.role_field
      end
      
      def ds_field_value
        role_subject.send(role_subject.class.role_field)
      end      
    end        
  end
end