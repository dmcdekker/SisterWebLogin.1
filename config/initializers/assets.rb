# Be sure to restart your server when you modify this file.
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( staticpages.css )
Rails.application.config.assets.precompile += %w( staticpages.js )
Rails.application.config.assets.precompile += %w( show.css )
Rails.application.config.assets.precompile += %w( calendar.css )
Rails.application.config.assets.precompile += %w( event.css )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( userindex.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( userblogindex.css )
Rails.application.config.assets.precompile += %w( custom.css )
Rails.application.config.assets.precompile += %w( about.css )
Rails.application.config.assets.precompile += %w( signup.css )
Rails.application.config.assets.precompile += %w( blogpost.css )
Rails.application.config.assets.precompile += %w( newcomment.css )
Rails.application.config.assets.precompile += %w( editcomment.css )
Rails.application.config.assets.precompile += %w( createcomment.css )
Rails.application.config.assets.precompile += %w( editprofile.css )