require 'test_helper'

class ArmrequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get armrequest_index_url
    assert_response :success
  end

  test "should get new" do
    get armrequest_new_url
    assert_response :success
  end

  test "should get create" do
    get armrequest_create_url
    assert_response :success
  end

  test "should get show" do
    get armrequest_show_url
    assert_response :success
  end

  test "should get edit" do
    get armrequest_edit_url
    assert_response :success
  end

  test "should get update" do
    get armrequest_update_url
    assert_response :success
  end

  test "should get destroy" do
    get armrequest_destroy_url
    assert_response :success
  end

end
