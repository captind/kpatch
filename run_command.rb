require 'json/pure'
require 'json/ext'
require 'aws-sdk'

module RunCommand
  def self.execute(options)
    options[:client].send_command({
      instance_ids: options[:instances],
      document_name: options[:document_name],
      timeout_seconds: 30,
      comment: options[:comment],
      parameters: options[:parameters],
      output_s3_bucket_name: options[:bucket],
      output_s3_key_prefix: options[:key_prefix],
    })
  end
end
