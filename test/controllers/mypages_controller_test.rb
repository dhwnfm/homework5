require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mypages_new_url
    assert_response :success
  end

  test "should get index" do
    get mypages_index_url
    assert_response :success
  end

  test "should get create" do
    get mypages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get mypages_destroy_url
    assert_response :success
  end

end
