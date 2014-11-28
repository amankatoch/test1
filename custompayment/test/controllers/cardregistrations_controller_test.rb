require 'test_helper'

class CardregistrationsControllerTest < ActionController::TestCase
  setup do
    @cardregistration = cardregistrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cardregistrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cardregistration" do
    assert_difference('Cardregistration.count') do
      post :create, cardregistration: { card_expires_on: @cardregistration.card_expires_on, card_type: @cardregistration.card_type, first_name: @cardregistration.first_name, ip_address: @cardregistration.ip_address, last_name: @cardregistration.last_name }
    end

    assert_redirected_to cardregistration_path(assigns(:cardregistration))
  end

  test "should show cardregistration" do
    get :show, id: @cardregistration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cardregistration
    assert_response :success
  end

  test "should update cardregistration" do
    patch :update, id: @cardregistration, cardregistration: { card_expires_on: @cardregistration.card_expires_on, card_type: @cardregistration.card_type, first_name: @cardregistration.first_name, ip_address: @cardregistration.ip_address, last_name: @cardregistration.last_name }
    assert_redirected_to cardregistration_path(assigns(:cardregistration))
  end

  test "should destroy cardregistration" do
    assert_difference('Cardregistration.count', -1) do
      delete :destroy, id: @cardregistration
    end

    assert_redirected_to cardregistrations_path
  end
end
