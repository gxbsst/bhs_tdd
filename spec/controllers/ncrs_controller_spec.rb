require 'spec_helper'
require 'rest_client'
require 'json'

describe 'NcrsController' do
  let(:params) {
    {
        database: 'bhs_development',
        access_token: token
    }
  }

  describe 'GET #show'  do
    let(:response) {
      url = full_path + '/ncrs/1'
      RestClient.get url, {params: params}
    }

    it "return a hash" do
      ncr = JSON.parse(response.body)

      expect(ncr).to eq('.')
    end
  end
end