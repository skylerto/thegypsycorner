require 'test_helper'

class Artists::PortfoliosControllerTest < ActionController::TestCase
  setup do
    @artists_portfolio = artists_portfolios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists_portfolios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artists_portfolio" do
    assert_difference('Artists::Portfolio.count') do
      post :create, artists_portfolio: { content: @artists_portfolio.content, image: @artists_portfolio.image, title: @artists_portfolio.title, user_id: @artists_portfolio.user_id }
    end

    assert_redirected_to artists_portfolio_path(assigns(:artists_portfolio))
  end

  test "should show artists_portfolio" do
    get :show, id: @artists_portfolio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artists_portfolio
    assert_response :success
  end

  test "should update artists_portfolio" do
    patch :update, id: @artists_portfolio, artists_portfolio: { content: @artists_portfolio.content, image: @artists_portfolio.image, title: @artists_portfolio.title, user_id: @artists_portfolio.user_id }
    assert_redirected_to artists_portfolio_path(assigns(:artists_portfolio))
  end

  test "should destroy artists_portfolio" do
    assert_difference('Artists::Portfolio.count', -1) do
      delete :destroy, id: @artists_portfolio
    end

    assert_redirected_to artists_portfolios_path
  end
end
