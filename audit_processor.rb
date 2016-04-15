require 'json/pure'
require 'json/ext'
require 'aws-sdk'

module AuditProcessor
  def self.get_packages_number(contents)
    contents.size > 0 ? contents[1].scan(/\d+/).first.to_i : nil
  end

  def self.ssm_file_path_from_event(json_event)
    j = JSON.parse(JSON.parse(json_event)['Message'])['Records']
    bucket = j.first['s3']['bucket']['name']
    s3_key = j.first['s3']['object']['key']
    File.join(bucket, s3_key)
  end
end
