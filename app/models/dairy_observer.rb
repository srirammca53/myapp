class DairyObserver < ActiveRecord::Observer
observe :dairy
# using obeserver before_create
def before_create (model)
model.location = model.location.capitalize
end
# using obeserver after_validation
def after_validation (model)
model.name = model.name.upcase
end
# using obeserver before_save
def before_save (model)
if model.address.nil?
model.address = "my address"
end
end

end
