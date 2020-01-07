module TencentCloudSms
  class Configuration
    class << self
      attr_accessor :sms_sdk_appid, :template_id, :secret_id, :secret_key, :sign
      def config
        yield self if block_given?
      end
    end
  end
end
