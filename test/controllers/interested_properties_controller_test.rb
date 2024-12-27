require "test_helper"

class InterestedPropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interested_properties_index_url
    assert_response :success
  end
end
