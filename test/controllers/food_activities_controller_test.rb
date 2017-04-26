require 'test_helper'

class FoodActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_activity = food_activities(:one)
  end

  test "should get index" do
    get food_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_food_activity_url
    assert_response :success
  end

  test "should create food_activity" do
    assert_difference('FoodActivity.count') do
      post food_activities_url, params: { food_activity: { childern_id: @food_activity.childern_id, food_id: @food_activity.food_id, food_type: @food_activity.food_type, percentage: @food_activity.percentage } }
    end

    assert_redirected_to food_activity_url(FoodActivity.last)
  end

  test "should show food_activity" do
    get food_activity_url(@food_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_activity_url(@food_activity)
    assert_response :success
  end

  test "should update food_activity" do
    patch food_activity_url(@food_activity), params: { food_activity: { childern_id: @food_activity.childern_id, food_id: @food_activity.food_id, food_type: @food_activity.food_type, percentage: @food_activity.percentage } }
    assert_redirected_to food_activity_url(@food_activity)
  end

  test "should destroy food_activity" do
    assert_difference('FoodActivity.count', -1) do
      delete food_activity_url(@food_activity)
    end

    assert_redirected_to food_activities_url
  end
end
