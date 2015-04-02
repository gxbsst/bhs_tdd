require 'spec_helper'
require 'rest_client'
require 'json'

# batch_id = fields.Many2one('iqc_base.batch')
# part_no = fields.Char(string='Part No')
# pos = fields.Char(string='Pos')
# rule_id = fields.Many2one('iqc.inspection.rule')
# # is_ok = fields.Boolean('OK')
# part_id = fields.Many2one('iqc_base.part')
# inspector_id = fields.Many2one('iqc_base.inspector')
# description = fields.Text()
# status = fields.Selection([('ng', 'ng'), ('ok', 'ok')], 'Status', default='ng')
# value = fields.Float('Value')
# inspection_id = fields.Many2one('iqc.inspection.inspection')


describe 'InspectionLogsController' do
  let(:database) {
    'bhs_development'
  }
  let(:batch) {
    odoo.const_get('iqc_base.batch').find(:last)
  }
  let(:package) {
    odoo.const_get('iqc_base.package').find(:last)
  }
  let(:rule) {
    odoo.const_get('iqc.inspection.rule').find(:first)
  }

  let(:rule) {
    odoo.const_get('iqc.inspection.rule').find(:first)
  }

  # batch_id,
  #     package_id,
  #     measurement,
  #     description
  # status
  let(:params) {
    {
        batch_id: batch.id,
        package_id: package.id,
        measurement: 11.20,
        description: 'hello....',
        status: 'ng'
    }
  }

  describe 'POST #create' do
    context 'the type of rule is quantitative' do
      let(:response) {
        url = "#{full_path}/inspection_logs/?database=#{database}&access_token=#{token}"
        RestClient.post url, params
      }

      it 'return 200' do
        log = JSON.parse(response.body)
        expect(log['status']).to eq('ok')
      end
    end

    context 'the type of rule is qualitative' do
      let(:response) {
        url = "#{full_path}/inspection_logs/?database=#{database}&access_token=#{token}"
        RestClient.post url, params
      }

      it 'return 200' do
        log = JSON.parse(response.body)
        expect(log).to eq('.')
        expect(log['status']).to eq('ok')
      end
    end

  end

  describe 'POST #create' do

    context 'the type of rule is qualitative' do
      let(:response) {
        params.merge!(description: 'hhhh', measurement: 110.20)
        url = "#{full_path}/inspection_logs/23/?database=#{database}&access_token=#{token}"
        RestClient.patch url, params
      }

      it 'return 200' do
        log = JSON.parse(response.body)
        pp log
        expect(log).to eq('.')
        expect(log['status']).to eq('ok')
      end
    end

  end
end