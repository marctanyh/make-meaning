require 'test_helper'

class OppourtunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oppourtunity = oppourtunities(:one)
  end

  test "should get index" do
    get oppourtunities_url
    assert_response :success
  end

  test "should get new" do
    get new_oppourtunity_url
    assert_response :success
  end

  test "should create oppourtunity" do
    assert_difference('Oppourtunity.count') do
      post oppourtunities_url, params: { oppourtunity: { name: @oppourtunity.name } }
    end

    assert_redirected_to oppourtunity_url(Oppourtunity.last)
  end

  test "should show oppourtunity" do
    get oppourtunity_url(@oppourtunity)
    assert_response :success
  end

  test "should get edit" do
    get edit_oppourtunity_url(@oppourtunity)
    assert_response :success
  end

  test "should update oppourtunity" do
    patch oppourtunity_url(@oppourtunity), params: { oppourtunity: { name: @oppourtunity.name } }
    assert_redirected_to oppourtunity_url(@oppourtunity)
  end

  test "should destroy oppourtunity" do
    assert_difference('Oppourtunity.count', -1) do
      delete oppourtunity_url(@oppourtunity)
    end

    assert_redirected_to oppourtunities_url
  end
end
