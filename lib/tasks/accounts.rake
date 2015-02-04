# require 'ruby-progressbar'
# require 'lol'
# desc 'Import Items'

# task update_accounts: [:environment] do

#   progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
#                                  progress_mark:  ' ',
#                                  remainder_mark: '･',
#                                  total:          nil,
#                                  title:          'Importing items')

#   # Set progressbar Items
#   progress.total = Account.all.count
  
#   Account.each do |account|
#     # Initiate client
#     client = Lol::Client.new Settings.rito.api_key, {region: account.server}

#     # Get League information
#     client.league.get(account.league_id)

#     # Increment progressbar
#     progress.increment
#   end

# end