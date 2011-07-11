require 'test_helper'

class ImplantationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Implantation.new.valid?
  end
end
