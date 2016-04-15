require 'rspec'
require_relative '../audit_processor'

describe AuditProcessor do
  describe '#get_packages_number' do
    it 'returns nil if the content is empty' do
      expect(
        AuditProcessor.get_packages_number('')
      ).to be_nil
    end

    it 'returns the number of packages if the content is not empty' do
      expect(
        AuditProcessor.get_packages_number(IO.readlines(File.join('spec', 'support', 's3_audit_content.txt')))
      ).to eq 50
    end
  end

  describe '#ssm_file_path_from_event' do
    it 'returns the file path from a parsed event' do
      expect(
        AuditProcessor.ssm_file_path_from_event(File.open(File.join('spec', 'support', 's3_ssm_event.txt'), 'rb').read)
      ).to eq 'easyjet-non-production-support/wsus/ssm/7c98b1dd-6419-4db1-9330-748c1fe8401f/i-b450650d/awspsModule/stdout.txt'
    end
  end
end
