require 'aws-sdk'

module S3
  def self.get_ssm_file(file_path)
    CONFIG[:s3][:client].get_object(
      bucket: CONFIG[:s3][:ssm_bucket],
      key: "#{CONFIG[:s3][:ssm_path]}/#{file_path}"
    ).body.read
  end
end
