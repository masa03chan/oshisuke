require "test_helper"

class Public::ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get public_contents_resources_url
    assert_response :success
  end
end
