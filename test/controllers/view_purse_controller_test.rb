require "test_helper"

class ViewPurseControllerTest < ActionDispatch::IntegrationTest
  test "should get view_stats" do
    get view_purse_view_stats_url
    assert_response :success
  end

  test "should get view_abilities" do
    get view_purse_view_abilities_url
    assert_response :success
  end
end
