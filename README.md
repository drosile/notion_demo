# Notion hack day demo

This is a very crude way to access the notion API through a website.

I didn't bother to add the OAuth2, so you need to do that part on your own and throw the access token into the environment.

# Installation

`bundle install`

# Operation

`export NOTION_API_TOKEN=your_api_token`

`bundle exec ruby notion.rb`
