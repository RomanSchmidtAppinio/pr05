require 'test/unit'
require './Task2/partner_v2'
require './Task2/Error/ambiguous_v2_error'

class PartnerV2Test < Test::Unit::TestCase
  def test_create_succ
    address = AddressV2.new('street_partner_test_1', 1, 'zip1', 'city1', 'country1')
    partner = PartnerV2.new('partner_name1', 'last_name1', address)
    assert_true(partner.is_a? PartnerV2)
  end

  def test_create_err_double
    address = AddressV2.new('street_partner_test_2', 2, 'zip2', 'city2', 'country2')
    partner = PartnerV2.new('partner_name2', 'last_name2', address)
    assert_true(partner.is_a? PartnerV2)
    assert_raise(AmbiguousV2Error) do
      PartnerV2.new('partner_name2', 'last_name2', address)
    end
  end

  def test_create_err_fname_empty1
    address = AddressV2.new('street_partner_test_3', 3, 'zip3', 'city3', 'country3')
    assert_raise(ArgumentError) do
      PartnerV2.new(nil, 'last_name1', address)
    end
  end

  def test_create_err_fname_empty2
    address = AddressV2.new('street_partner_test_4', 4, 'zip4', 'city4', 'country4')
    assert_raise(ArgumentError) do
      PartnerV2.new('   ', 'last_name1', address)
    end
  end

  def test_create_err_fname_int
    address = AddressV2.new('street_partner_test_5', 5, 'zip5', 'city5', 'country5')
    assert_raise(ArgumentError) do
      PartnerV2.new(1, 'last_name1', address)
    end
  end

  def test_create_err_lname_empty1
    address = AddressV2.new('street_partner_test_6', 6, 'zip6', 'city6', 'country6')
    assert_raise(ArgumentError) do
      PartnerV2.new('partner_name3', nil, address)
    end
  end

  def test_create_err_lname_empty2
    address = AddressV2.new('street_partner_test_7', 7, 'zip7', 'city7', 'country7')
    assert_raise(ArgumentError) do
      PartnerV2.new('partner_name4', '   ', address)
    end
  end

  def test_create_err_lname_int
    address = AddressV2.new('street_partner_test_8', 8, 'zip8', 'city8', 'country8')
    assert_raise(ArgumentError) do
      PartnerV2.new('partner_name5', 1, address)
    end
  end
end