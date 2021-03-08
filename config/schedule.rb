# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, 'log/crontab.log'
set :environment, :development
set :runner_command, "rails runner"
#
# every 12.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

# every 1.days, at: '9:00 am' do
  every 1.day, at: '9:00 am' do

# Rails内のメソッド実行
  runner "Batch::MailDay.send_mail"
end

# Learn more: http://github.com/javan/whenever