require "application_system_test_case"

class VulnsTest < ApplicationSystemTestCase
  setup do
    @vuln = vulns(:one)
  end

  test "visiting the index" do
    visit vulns_url
    assert_selector "h1", text: "Vulns"
  end

  test "should create vuln" do
    visit vulns_url
    click_on "New vuln"

    fill_in "Cve", with: @vuln.cve
    fill_in "Discovered", with: @vuln.discovered
    fill_in "Vuln name", with: @vuln.vuln_name
    fill_in "Vuln type", with: @vuln.vuln_type
    click_on "Create Vuln"

    assert_text "Vuln was successfully created"
    click_on "Back"
  end

  test "should update Vuln" do
    visit vuln_url(@vuln)
    click_on "Edit this vuln", match: :first

    fill_in "Cve", with: @vuln.cve
    fill_in "Discovered", with: @vuln.discovered
    fill_in "Vuln name", with: @vuln.vuln_name
    fill_in "Vuln type", with: @vuln.vuln_type
    click_on "Update Vuln"

    assert_text "Vuln was successfully updated"
    click_on "Back"
  end

  test "should destroy Vuln" do
    visit vuln_url(@vuln)
    click_on "Destroy this vuln", match: :first

    assert_text "Vuln was successfully destroyed"
  end
end
