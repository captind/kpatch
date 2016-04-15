require 'rspec'
require 'pry'
require 'aws-sdk'

CONFIG = {
  s3: {
    client: Aws::S3::Client.new(profile: 'rudge', region: 'eu-west-1'),
    ssm_bucket: 'doufoskpatch',
    ssm_path: 'ssm'
  }
}.freeze

