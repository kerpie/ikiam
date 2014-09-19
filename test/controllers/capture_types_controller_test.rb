require 'test_helper'

class CaptureTypesControllerTest < ActionController::TestCase
  setup do
    @capture_type = capture_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capture_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capture_type" do
    assert_difference('CaptureType.count') do
      post :create, capture_type: { name: @capture_type.name }
    end

    assert_redirected_to capture_type_path(assigns(:capture_type))
  end

  test "should show capture_type" do
    get :show, id: @capture_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capture_type
    assert_response :success
  end

  test "should update capture_type" do
    patch :update, id: @capture_type, capture_type: { name: @capture_type.name }
    assert_redirected_to capture_type_path(assigns(:capture_type))
  end

  test "should destroy capture_type" do
    assert_difference('CaptureType.count', -1) do
      delete :destroy, id: @capture_type
    end

    assert_redirected_to capture_types_path
  end
end
