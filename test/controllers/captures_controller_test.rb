require 'test_helper'

class CapturesControllerTest < ActionController::TestCase
  setup do
    @capture = captures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:captures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capture" do
    assert_difference('Capture.count') do
      post :create, capture: { altitude: @capture.altitude, capture_type_id: @capture.capture_type_id, description: @capture.description, environment_description: @capture.environment_description, humidity: @capture.humidity, latitude: @capture.latitude, longitude: @capture.longitude, region_id: @capture.region_id, season_id: @capture.season_id, temperature: @capture.temperature, time: @capture.time, user_id: @capture.user_id }
    end

    assert_redirected_to capture_path(assigns(:capture))
  end

  test "should show capture" do
    get :show, id: @capture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capture
    assert_response :success
  end

  test "should update capture" do
    patch :update, id: @capture, capture: { altitude: @capture.altitude, capture_type_id: @capture.capture_type_id, description: @capture.description, environment_description: @capture.environment_description, humidity: @capture.humidity, latitude: @capture.latitude, longitude: @capture.longitude, region_id: @capture.region_id, season_id: @capture.season_id, temperature: @capture.temperature, time: @capture.time, user_id: @capture.user_id }
    assert_redirected_to capture_path(assigns(:capture))
  end

  test "should destroy capture" do
    assert_difference('Capture.count', -1) do
      delete :destroy, id: @capture
    end

    assert_redirected_to captures_path
  end
end
