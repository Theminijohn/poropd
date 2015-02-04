require 'ruby-progressbar'
require 'lol'
desc 'Import Items'

task import_items: [:environment] do

  progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
                                 progress_mark:  ' ',
                                 remainder_mark: '･',
                                 total:          nil,
                                 title:          'Importing items')

  # Initiate client
  client = Lol::Client.new Settings.rito.api_key, {region: 'na'}

  # Set progressbar Items
  progress.total = client.static.item.get.count

  # Delete all Items
  Item.delete_all

  # Loop over items
  client.static.item.get.each do |item|
    
    # Create item in DB
    Item.create(
      league_id:   item.id,
      plaintext:   item.plaintext,
      description: item.description,
      name:        item.name,
      group:       item.try(:group),
      image:       "http://ddragon.leagueoflegends.com/cdn/4.20.1/img/item/#{item.id}.png "
    )

    # Increment progressbar
    progress.increment
  end

end


# Item Description ####
#######################

# <stats>
#   +500 Health <br>
#   +10% Cooldown Reduction
# </stats>

# <br>
# <br>

# <unique>
#   UNIQUE Passive - Tenacity:
# </unique> 

# Reduces the duration of stuns, slows, taunts, fears, silences, blinds, polymorphs, and immobilizes by 35%.

# <br>
# <br>

# <i>
#   (Unique Passives with the same name don't stack.)
# </i>