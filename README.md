# TencentCloudSms

Send sms by tencent cloud sms service

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tencent_cloud_sms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tencent_cloud_sms

## Usage

#### Configuration

```ruby
TencentCloudSms::Configuration.config do |c|
  c.sign = "sign"
  c.sms_sdk_appid = 'appid'
  c.template_id = 123
  c.secret_id = 'secret_id'
  c.secret_key = 'secret_key'
end
```
#### Send Msg

```ruby
TencentCloudSms.send_msg("18888888888", "msg")
```

