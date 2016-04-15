require_relative 'spec_helper'
require_relative '../s3'

describe S3 do
  describe '#get_object' do
    it 'returns the content of an S3 object' do
      expect(
        S3.get_ssm_file('93c2f974-dc41-4206-9fd0-bf1625377891/i-463f9aca/awspsModule/stdout.txt')
      ).to match(/Connecting to Windows Update server/)
    end
  end
end
