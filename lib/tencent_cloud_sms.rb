require "tencent_cloud_sms/version"
require "tencent_cloud_sms/configuration"
require "httparty"

module TencentCloudSms
  URL = 'sms.tencentcloudapi.com'
  class Error < StandardError; end

  class << self
    attr_accessor :phone_number, :msg, :time_now, :nonce
    def send_msg(phone_number, msg)
      assign_attributes(phone_number, msg)
      res = HTTParty.get("https://#{URL}/", query: params_with_sign)
      result = JSON.load(res.body)
      result_code = result["Response"]["SendStatusSet"].first["Code"]
      return 'success' if result_code == 'Ok'
      result_code  #LimitExceeded.PhoneNumberDailyLimit 单手机超出每日限制
    end

    private

    def assign_attributes(phone_number, msg)
      self.phone_number = phone_number
      self.msg = msg
      self.time_now = Time.now.to_i
      self.nonce = create_nonce
    end

    def params_with_sign
      params.merge('Signature' => signature)
    end

    def signature
      sign_str = "GET#{URL}/?" + params.sort.map { |param| param.join('=') }.join('&')
      Base64.encode64(OpenSSL::HMAC.digest('sha1', Configuration.secret_key, sign_str)).strip
    end

    def params
      {
        'Action'=> 'SendSms',
        'Version'=> '2019-07-11',
        'SmsSdkAppid'=> Configuration.sms_sdk_appid,
        'PhoneNumberSet.0'=> "+86" + phone_number,
        'TemplateID'=> Configuration.template_id,
        'TemplateParamSet.0'=> msg,
        'Timestamp'=> time_now,
        'Nonce'=> nonce,
        'SecretId'=> Configuration.secret_id,
        'Sign'=> Configuration.sign
      }
    end

    def create_nonce
      Random.new.rand(100000..999999).to_s
    end
  end
end
