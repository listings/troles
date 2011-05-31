require 'trole_spec'
User.role_strategy :bit_one

# User.valid_roles = [:user, :editor] # override default [:user, :admin]

describe Trole::Strategy::BitOne do
  let(:kris)    { Factory.create :user, :trole => 1 } # set to :user
  
  subject { kris }  
    # Core API
    specify       { lambda { kris.role_field }.should raise_error } # is a class method    
    specify       { User.role_field.should == :trole }
    
    # 
    # its(:role)        { should be_a Trole::Operations }
    # its(:role_name)   { should == :admin }
    # 
    # its(:role_list)   { should == [:admin] }
  # it { should be_valid }            
  # its(:errors) { should be_empty }
  # ################################################################################
  # # specify (generated descriptions)
  # # instead of repeating expectation with: it "should not be published"...)
  # specify { blog_post.should_not be_published }
  # 
  # ################################################################################
  # # subject (delegate should/should_not to subject)
  # subject { BlogPost.new :title => 'foo', :body => 'bar' }
  #  it "sets published timestamp" do
  #    subject.publish!
  #    subject.should be_published
  #  end
  # 
  # it { should be_valid }
  # its(:errors) { should be_empty }
  # its(:title) { should == 'foo' }


end