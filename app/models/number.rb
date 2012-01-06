class Number < ActiveRecord::Base
  default_scope :order => :value
  validates_numericality_of :value, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 90
  validates_uniqueness_of :value
end
