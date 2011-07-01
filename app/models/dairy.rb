class Dairy < ActiveRecord::Base
validates :name, :presence => true, :length => {:minimum => 2, :maximum => 12}
validates :relation, :presence => true
validates :mobile, :numericality => true, :length => { :is => 10 }
validates :location, :presence => true, :uniqueness => { :case_sensitive => false }
validates :email, :confirmation => true, :presence => true, :uniqueness => true, :on => :create
validates :email_confirmation, :presence => true, :unless => Proc.new { |a| a.email_confirmation.blank? }

validates :dob, :presence => true
def user_validation
    errors.add(:name, "cannot contain the characters !@#%*()_-+=") if
    !name :format => { :with => /\A[a-zA-Z]+\z/, :message => "only letters" }
  end
#validates_with MyValidation, :fields => [:mobile]
validates_each :name,  do |model, attr, value|
    model.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
  end
# Using callbacks before validations
before_validation :name_with_location
 protected
  def name_with_location
    if location.nil?
      dairy.location = "home town"
    end
  end

# using callbacks before_create
before_create do |dairy|
    dairy.address = dairy.name.capitalize if dairy.address.blank?
  end
# using callbacjs after_validation
after_validation do |dairy|
dairy.mobile = "0#{dairy.mobile}"
end
end

class MyValidation < ActiveModel::Validator
  def validate(record)
     if options[:fields].any?{|field| record.send(field) == "9849098490" }
      record.errors[:base] << "This is reserved mobile number"
    end
  end
# using 
end
 

