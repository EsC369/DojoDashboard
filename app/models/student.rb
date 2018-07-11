class Student < ActiveRecord::Base
  belongs_to :dojo
  validates :first_name, :last_name, :email, presence: true # check if all is included
end
