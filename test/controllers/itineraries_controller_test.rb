require "test_helper"

class ItinerariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:one)
  end

  test "should get index" do
    get itineraries_url
    assert_response :success
  end

  test "should get new" do
    get new_itinerary_url
    assert_response :success
  end

  test "should create itinerary" do
    assert_difference("Itinerary.count") do
      post itineraries_url, params: { itinerary: { datetime: @itinerary.datetime, description: @itinerary.description, location: @itinerary.location } }
    end

    assert_redirected_to itinerary_url(Itinerary.last)
  end

  test "should show itinerary" do
    get itinerary_url(@itinerary)
    assert_response :success
  end

  test "should get edit" do
    get edit_itinerary_url(@itinerary)
    assert_response :success
  end

  test "should update itinerary" do
    patch itinerary_url(@itinerary), params: { itinerary: { datetime: @itinerary.datetime, description: @itinerary.description, location: @itinerary.location } }
    assert_redirected_to itinerary_url(@itinerary)
  end

  test "should destroy itinerary" do
    assert_difference("Itinerary.count", -1) do
      delete itinerary_url(@itinerary)
    end

    assert_redirected_to itineraries_url
  end
end
