require 'aws-sdk-ses'

Aws.config.update({
  region: 'your-aws-region',
  credentials: Aws::Credentials.new('your-access-key-id', 'your-secret-access-key')
})