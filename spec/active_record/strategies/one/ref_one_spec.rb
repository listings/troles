require "active_record/strategy_helper"
require 'active_record/models/ref_one'

def migrate_up
  CreateRefOne.up # run migration
  Config.add_roles [:user, :admin, :editor, :blogger]
end

def migrate_down
  CreateRefOne.down
end      

User.troles_strategy :ref_one do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

module UserSetup
  def find_role name
    Role.where(:name => name.to_sym).first
  end

  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :trole => nil
  end

  def create_user
    Factory.create :user, :name => 'normal', :trole => find_role(:user)
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => find_role(:admin)
  end
end


require 'troles/common/api_spec' # Common API examples  

describe 'Troles strategy :ref_one' do
  it_should_behave_like "Common API"
  # it_should_behave_like "Troles API"  
end    
