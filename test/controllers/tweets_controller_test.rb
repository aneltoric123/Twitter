require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_index_url
    assert_response :success
  end

  test "should get show" do
    get tweets_show_url
    assert_response :success
  end

  test "should get new" do
    get tweets_new_url
    assert_response :success
  end

  test "should get edit" do
    get tweets_edit_url
    assert_response :success
  end

  test "should get create" do
    get tweets_create_url
    assert_response :success
  end

  test "should get destory" do
    get tweets_destory_url
    assert_response :success
  end
end
