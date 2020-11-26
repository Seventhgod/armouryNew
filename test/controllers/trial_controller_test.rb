require 'test_helper'

class TrialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trial_index_url
    assert_response :success
  end

end
