require_relative "test_helper"

class ImporterTest < Minitest::Test
  def test_the_truth
    assert Importer.run ""
  end
end
