require 'test_helper'

class ArmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arms_index_url
    assert_response :success
  end

  test "should get new" do
    get arms_new_url
    assert_response :success
  end

  test "should get create" do
    get arms_create_url
    assert_response :success
  end

  test "should get show" do
    get arms_show_url
    assert_response :success
  end

  test "should get edit" do
    get arms_edit_url
    assert_response :success
  end

  test "should get update" do
    get arms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get arms_destroy_url
    assert_response :success
  end

end
