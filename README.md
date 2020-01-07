# TencentCloudSms

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tencent_cloud_sms`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

