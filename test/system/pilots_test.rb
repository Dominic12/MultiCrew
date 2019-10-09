require "application_system_test_case"

class PilotsTest < ApplicationSystemTestCase
  setup do
    @pilot = pilots(:one)
  end

  test "visiting the index" do
    visit pilots_url
    assert_selector "h1", text: "Pilots"
  end

  test "creating a Pilot" do
    visit pilots_url
    click_on "New Pilot"

    fill_in "About", with: @pilot.about
    fill_in "Hours", with: @pilot.hours
    fill_in "Lastname", with: @pilot.lastname
    fill_in "Name", with: @pilot.name
    fill_in "Simulator", with: @pilot.simulator
    click_on "Create Pilot"

    assert_text "Pilot was successfully created"
    click_on "Back"
  end

  test "updating a Pilot" do
    visit pilots_url
    click_on "Edit", match: :first

    fill_in "About", with: @pilot.about
    fill_in "Hours", with: @pilot.hours
    fill_in "Lastname", with: @pilot.lastname
    fill_in "Name", with: @pilot.name
    fill_in "Simulator", with: @pilot.simulator
    click_on "Update Pilot"

    assert_text "Pilot was successfully updated"
    click_on "Back"
  end

  test "destroying a Pilot" do
    visit pilots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pilot was successfully destroyed"
  end
end
