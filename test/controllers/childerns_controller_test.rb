require 'test_helper'

class ChildernsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @childern = childerns(:one)
  end

  test "should get index" do
    get childerns_url
    assert_response :success
  end

  test "should get new" do
    get new_childern_url
    assert_response :success
  end

  test "should create childern" do
    assert_difference('Childern.count') do
      post childerns_url, params: { childern: { app_id: @childern.app_id, name: @childern.name } }
    end

    assert_redirected_to childern_url(Childern.last)
  end

  test "should show childern" do
    get childern_url(@childern)
    assert_response :success
  end

  test "should get edit" do
    get edit_childern_url(@childern)
    assert_response :success
  end

  test "should update childern" do
    patch childern_url(@childern), params: { childern: { app_id: @childern.app_id, name: @childern.name } }
    assert_redirected_to childern_url(@childern)
  end

  test "should destroy childern" do
    assert_difference('Childern.count', -1) do
      delete childern_url(@childern)
    end

    assert_redirected_to childerns_url
  end
end
