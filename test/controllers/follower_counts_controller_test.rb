require 'test_helper'

class FollowerCountsControllerTest < ActionController::TestCase
  setup do
    @follower_count = follower_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follower_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follower_count" do
    assert_difference('FollowerCount.count') do
      post :create, follower_count: { candidate_id: @follower_count.candidate_id, twitter_follwers: @follower_count.twitter_follwers }
    end

    assert_redirected_to follower_count_path(assigns(:follower_count))
  end

  test "should show follower_count" do
    get :show, id: @follower_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @follower_count
    assert_response :success
  end

  test "should update follower_count" do
    patch :update, id: @follower_count, follower_count: { candidate_id: @follower_count.candidate_id, twitter_follwers: @follower_count.twitter_follwers }
    assert_redirected_to follower_count_path(assigns(:follower_count))
  end

  test "should destroy follower_count" do
    assert_difference('FollowerCount.count', -1) do
      delete :destroy, id: @follower_count
    end

    assert_redirected_to follower_counts_path
  end
end
