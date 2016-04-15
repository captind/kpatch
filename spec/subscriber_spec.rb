require 'spec_helper'
require 'aws-sdk'
require 'json'
require_relative '../worker_mapper'

module Subscriber

end

describe Subscriber do
  it 'works' do
    # creds = YAML.load(File.read('/path/to/secrets'))
    client = Aws::SQS::Client.new(profile: 'rudge', region: 'eu-west-1')
		resp = client.receive_message({
		  queue_url: 'https://sqs.eu-west-1.amazonaws.com/028195356432/KPatch',
		  max_number_of_messages: 1,
		  visibility_timeout: 1,
		  wait_time_seconds: 1
		})
    worker = WorkerMapper.get_module(JSON.parse(resp.messages.first.body)['Subject'])
    p worker.ssm_file_path_from_event(resp.messages.first.body)
  end
end
