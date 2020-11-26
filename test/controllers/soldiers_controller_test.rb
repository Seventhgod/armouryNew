require 'test_helper'

class SoldiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get soldiers_index_url
    assert_response :success
  end

  test "should get new" do
    get soldiers_new_url
    assert_response :success
  end

  test "should get create" do
    get soldiers_create_url
    assert_response :success
  end

  test "should get show" do
    get soldiers_show_url
    assert_response :success
  end

  test "should get edit" do
    get soldiers_edit_url
    assert_response :success
  end

  test "should get update" do
    get soldiers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get soldiers_destroy_url
    assert_response :success
  end

end
