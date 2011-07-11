require 'test_helper'

class CabinetsControllerTest < ActionController::TestCase
  setup do
    @cabinet = cabinets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cabinets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cabinet" do
    assert_difference('Cabinet.count') do
      post :create, cabinet: @cabinet.attributes
    end

    assert_redirected_to cabinet_path(assigns(:cabinet))
  end

  test "should show cabinet" do
    get :show, id: @cabinet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cabinet.to_param
    assert_response :success
  end

  test "should update cabinet" do
    put :update, id: @cabinet.to_param, cabinet: @cabinet.attributes
    assert_redirected_to cabinet_path(assigns(:cabinet))
  end

  test "should destroy cabinet" do
    assert_difference('Cabinet.count', -1) do
      delete :destroy, id: @cabinet.to_param
    end

    assert_redirected_to cabinets_path
  end
end
