require 'test_helper'

class FreeMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @free_match = free_matches(:one)
  end

  test "should get index" do
    get free_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_free_match_url
    assert_response :success
  end

  test "should create free_match" do
    assert_difference('FreeMatch.count') do
      post free_matches_url, params: { free_match: {  } }
    end

    assert_redirected_to free_match_url(FreeMatch.last)
  end

  test "should show free_match" do
    get free_match_url(@free_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_free_match_url(@free_match)
    assert_response :success
  end

  test "should update free_match" do
    patch free_match_url(@free_match), params: { free_match: {  } }
    assert_redirected_to free_match_url(@free_match)
  end

  test "should destroy free_match" do
    assert_difference('FreeMatch.count', -1) do
      delete free_match_url(@free_match)
    end

    assert_redirected_to free_matches_url
  end
end
