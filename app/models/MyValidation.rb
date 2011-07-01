 
class MyValidation < ActiveModel::Validator
  def validate(email)
    if dairy.email == "sriram.in20@gmail.com"
      dairy.errors[:base] << "This is reserved mail id"
    end
  end
end
