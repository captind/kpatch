require 'aws-sdk'
require 'json'
require_relative 'audit_processor'

module WorkerMapper
  def self.get_module(message_type)
    self.map[message_type]
  end

  def self.map
    {
      'Amazon S3 Notification' => AuditProcessor
    }
  end
end
