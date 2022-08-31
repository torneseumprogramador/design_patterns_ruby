require "test_helper"

class AvivoSubscribesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avivo_subscribe = avivo_subscribes(:one)
  end

  test "should get index" do
    get avivo_subscribes_url, as: :json
    assert_response :success
  end

  test "should create avivo_subscribe" do
    assert_difference("AvivoSubscribe.count") do
      post avivo_subscribes_url, params: { avivo_subscribe: { tipo_campeonato: @avivo_subscribe.tipo_campeonato, usuario_id_id: @avivo_subscribe.usuario_id_id } }, as: :json
    end

    assert_response :created
  end

  test "should show avivo_subscribe" do
    get avivo_subscribe_url(@avivo_subscribe), as: :json
    assert_response :success
  end

  test "should update avivo_subscribe" do
    patch avivo_subscribe_url(@avivo_subscribe), params: { avivo_subscribe: { tipo_campeonato: @avivo_subscribe.tipo_campeonato, usuario_id_id: @avivo_subscribe.usuario_id_id } }, as: :json
    assert_response :success
  end

  test "should destroy avivo_subscribe" do
    assert_difference("AvivoSubscribe.count", -1) do
      delete avivo_subscribe_url(@avivo_subscribe), as: :json
    end

    assert_response :no_content
  end
end
