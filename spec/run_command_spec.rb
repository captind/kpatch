require 'rspec'
require_relative '../run_command'

describe RunCommand do
  it 'executes a SSM command' do
    client = Aws::SSM::Client.new(profile: 'ej-non-prod', region: 'eu-west-1')
    options = {
      client: client,
      instances: ['i-b450650d'],
      document_name: 'Gold-AMI-AuditUpdates',
      comment: 'Run audit updates',
      parameters: {},
      bucket: 'easyjet-non-production-support',
      key_prefix:'wsus/ssm'
    }
    puts RunCommand.execute(options)
  end
end
