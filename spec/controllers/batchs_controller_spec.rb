require 'spec_helper'
require 'rest_client'
require 'json'

describe 'BatchsController' do
  let(:params) {
    {
        database: 'bhs_development',
        access_token: token
    }
  }

  let(:keys) {
    ["work_no",
     "inspection_quantity",
     "arrival_date",
     "order_no",
     "part_no",
     "ok_quantity",
     "instruction",
     "supplier_no",
     "pos",
     "rules",
     "part",
     "ng_quantity",
     "inspection_datetime",
     "supplier",
     "is_urgent",
     "inspector",
     "id",
     "quantity"]
  }
  let(:result) {
    {"work_no"=>1,
     "inspection_quantity"=>1,
     "arrival_date"=>"2012-10-11 19:00:00",
     "order_no"=>"1",
     "part_no"=>"1",
     "ok_quantity"=>1,
     "instruction"=>[{"name"=>"name 1", "file"=>nil}],
     "supplier_no"=>"1",
     "pos"=>"1",
     "rules"=>[{"tool"=>"tool", "standard"=>1, "down"=>0, "step"=>1, "part_id"=>1, "id"=>1, "name"=>"name 1", "coord_y"=>21.0, "coord_x"=>11.0, "up"=>0, "type"=>"quantitative"},
               {"tool"=>"tool", "standard"=>1, "down"=>0, "step"=>2, "part_id"=>1, "id"=>2, "name"=>"name 1", "coord_y"=>21.0, "coord_x"=>11.0, "up"=>0, "type"=>"quantitative"},
               {"tool"=>"tool", "standard"=>1, "down"=>0, "step"=>3, "part_id"=>1, "id"=>3, "name"=>"name 1", "coord_y"=>21.0, "coord_x"=>11.0, "up"=>0, "type"=>"quantitative"}],
     "part"=>[{"instruction_id"=>2, "c3"=>"c3", "c2"=>"c2", "name_en"=>"name en 1", "c1"=>"c1", "unit"=>"package", "c4"=>"c4", "remark"=>"Remark....", "name"=>"name 1", "unit_en"=>"package", "id"=>1, "machine"=>"machine name"}],
     "ng_quantity"=>1, "inspection_datetime"=>false, "supplier"=>[{"name"=>"iqc_base.supplier", "no"=>"123456"}], "is_urgent"=>false, "inspector"=>[], "id"=>1, "quantity"=>1}
  }
  describe 'GET #show'  do
    let(:response) {
      url = full_path + '/batches/1'
      RestClient.get url, {params: params}
    }

    it "return a batch" do
      batch = JSON.parse(response.body)
      expect(batch.keys).to eq(keys)
    end
    it "return a hash" do
      batch = JSON.parse(response.body)

      expect(batch).to eq(result)
    end
  end
end