require 'rails_helper'

describe "Admin views dashboard", :type => :feature do
  scenario "and sees Admin Dashboard" do
    admin = create(:user, :role => 1)
    page.set_rack_session(:user_id => admin.id)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_on "Login"

    expect(current_path).to eq(admin_dashboard_path)
    
    within(".main") do
      expect(page).to have_content("Admin Dashboard")
    end
  end
end
