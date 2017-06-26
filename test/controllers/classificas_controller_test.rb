require 'test_helper'

class ClassificasControllerTest < ActionController::TestCase
  setup do
    @classifica = classificas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classificas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classifica" do
    assert_difference('Classifica.count') do
      post :create, classifica: { n_giornata: @classifica.n_giornata, punteggio: @classifica.punteggio, user_id: @classifica.user_id }
    end

    assert_redirected_to classifica_path(assigns(:classifica))
  end

  test "should show classifica" do
    get :show, id: @classifica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classifica
    assert_response :success
  end

  test "should update classifica" do
    patch :update, id: @classifica, classifica: { n_giornata: @classifica.n_giornata, punteggio: @classifica.punteggio, user_id: @classifica.user_id }
    assert_redirected_to classifica_path(assigns(:classifica))
  end

  test "should destroy classifica" do
    assert_difference('Classifica.count', -1) do
      delete :destroy, id: @classifica
    end

    assert_redirected_to classificas_path
  end
end
