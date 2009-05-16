require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  test "relink" do
    s = Story.relink('{PAGE laoroya.legalvictory0606 Peruvian High Court Orders Measures to Protect Public Health in La Oroya}') 
    assert_equal "<a href=\"/?q=laoroya.legalvictory0606\">Peruvian High Court Orders Measures to Protect Public Health in La Oroya</a>", s

    s = Story.relink('<li>{PAGE turtles.leatherback Sala Constitucional Costarricense admite amparo para proteger Playa Grande} <li>')
    assert_equal "<li><a href=\"/?q=turtles.leatherback\">Sala Constitucional Costarricense admite amparo para proteger Playa Grande</a> <li>", s
  end
  test "relink2" do
    s = Story.relink 'hi {PAGE andy.peterson Andy Peterson} and {PAGE bob_dylan Bob Dylan}'
    assert_equal "hi <a href=\"/?q=andy.peterson\">Andy Peterson</a> and <a href=\"/?q=bob_dylan\">Bob Dylan</a>", s
  end
end
