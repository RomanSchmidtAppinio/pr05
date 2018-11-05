require 'set'
require_relative '../Task1/partner'
require './Task1/unique'
require 'date'

# Author: Roman Schmidt, Daniel Osterholz
#
# Includes Unique model.
# Has a hash method to be comparable in hash.
# Has a eql? method which is defined as an synonym for == to make objects comparable.
# Overrides ensure_unique to delegate its own elements set.
class Customer < Partner
  include Unique
  alias_method :eql?, :==

  attr_reader(:birthday)

  private

  @@registered_elements = Set.new

  def initialize(first_name, last_name, birthday)
    raise ArgumentError unless birthday.is_a? Date

    @birthday = birthday
    @valet_sum = 0
    super(first_name, last_name)
  end

  protected

  def ensure_unique(parent_elements)
    if parent_elements.include?(self)
      raise AmbiguousError
    end
    super(@@registered_elements)
  end

  public

  def eql?(other)
    raise TypeError unless other.is_a? Customer
    other.birthday === @birthday
  end

  def hash
    super.hash * (31 + (@birthday === nil ? 0 : @birthday.hash))
  end
end