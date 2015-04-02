require 'spec_helper'
require 'rest_client'
require 'json'

describe 'PackagesController' do
  let(:params) {
    {
        database: 'bhs_development',
        access_token: token
    }
  }

  let(:keys) {
     []
  }
  let(:result) {
    {}
  }
  describe 'GET #show'  do
    let(:response) {
      url = full_path + '/packages/1111'
      RestClient.get url, {params: params}
    }

    it "return a package" do
      package = JSON.parse(response.body)
      pp response.body
      expect(package).to eq('name 1')
    end
  end
end