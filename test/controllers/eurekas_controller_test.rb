require 'test_helper'

class EurekasControllerTest < ActionController::TestCase
  setup do
    @eureka = eurekas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eurekas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eureka" do
    assert_difference('Eureka.count') do
      post :create, eureka: { due: @eureka.due, evento1: @eureka.evento1, evento2: @eureka.evento2, unouno: @eureka.unouno, unox: @eureka.unox, x: @eureka.x }
    end

    assert_redirected_to eureka_path(assigns(:eureka))
  end

  test "should show eureka" do
    get :show, id: @eureka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eureka
    assert_response :success
  end

  test "should update eureka" do
    patch :update, id: @eureka, eureka: { due: @eureka.due, evento1: @eureka.evento1, evento2: @eureka.evento2, unouno: @eureka.unouno, unox: @eureka.unox, x: @eureka.x }
    assert_redirected_to eureka_path(assigns(:eureka))
  end

  test "should destroy eureka" do
    assert_difference('Eureka.count', -1) do
      delete :destroy, id: @eureka
    end

    assert_redirected_to eurekas_path
  end
end
