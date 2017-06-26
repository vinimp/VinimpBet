require 'test_helper'

class BetPuntatesControllerTest < ActionController::TestCase
  setup do
    @bet_puntate = bet_puntates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bet_puntates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet_puntate" do
    assert_difference('BetPuntate.count') do
      post :create, bet_puntate: { bet_id: @bet_puntate.bet_id, user_id: @bet_puntate.user_id }
    end

    assert_redirected_to bet_puntate_path(assigns(:bet_puntate))
  end

  test "should show bet_puntate" do
    get :show, id: @bet_puntate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet_puntate
    assert_response :success
  end

  test "should update bet_puntate" do
    patch :update, id: @bet_puntate, bet_puntate: { bet_id: @bet_puntate.bet_id, user_id: @bet_puntate.user_id }
    assert_redirected_to bet_puntate_path(assigns(:bet_puntate))
  end

  test "should destroy bet_puntate" do
    assert_difference('BetPuntate.count', -1) do
      delete :destroy, id: @bet_puntate
    end

    assert_redirected_to bet_puntates_path
  end
end
