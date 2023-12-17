require "test_helper"

class VulnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vuln = vulns(:one)
  end

  test "should get index" do
    get vulns_url
    assert_response :success
  end

  test "should get new" do
    get new_vuln_url
    assert_response :success
  end

  test "should create vuln" do
    assert_difference("Vuln.count") do
      post vulns_url, params: { vuln: { cve: @vuln.cve, discovered: @vuln.discovered, vuln_name: @vuln.vuln_name, vuln_type: @vuln.vuln_type } }
    end

    assert_redirected_to vuln_url(Vuln.last)
  end

  test "should show vuln" do
    get vuln_url(@vuln)
    assert_response :success
  end

  test "should get edit" do
    get edit_vuln_url(@vuln)
    assert_response :success
  end

  test "should update vuln" do
    patch vuln_url(@vuln), params: { vuln: { cve: @vuln.cve, discovered: @vuln.discovered, vuln_name: @vuln.vuln_name, vuln_type: @vuln.vuln_type } }
    assert_redirected_to vuln_url(@vuln)
  end

  test "should destroy vuln" do
    assert_difference("Vuln.count", -1) do
      delete vuln_url(@vuln)
    end

    assert_redirected_to vulns_url
  end
end
