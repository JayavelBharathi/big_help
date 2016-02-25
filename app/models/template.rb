class Template < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Customer'
end
