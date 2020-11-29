require 'test_helper'

class OfficersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get officers_index_url
    assert_response :success
  end

  test "should get new" do
    get officers_new_url
    assert_response :success
  end

  test "should get create" do
    get officers_create_url
    assert_response :success
  end

  test "should get show" do
    get officers_show_url
    assert_response :success
  end

  test "should get edit" do
    get officers_edit_url
    assert_response :success
  end

  test "should get update" do
    get officers_update_url
    assert_response :success
  end

  test "should get delete" do
    get officers_delete_url
    assert_response :success
  end

end
